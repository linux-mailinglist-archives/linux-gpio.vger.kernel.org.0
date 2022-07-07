Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A54C56A1D5
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 14:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235395AbiGGMTh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 08:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbiGGMTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 08:19:35 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 356B715838
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jul 2022 05:19:29 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id r21so3303058eju.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jul 2022 05:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mmGaMP4xYq/Pz+AdbTpEleX3OSV7O/HdztwSvjvk9F0=;
        b=NFgiIcfwDwF/ghi+ynNgv8TDZcyCe9Q9kCQ/5kaaWR99ezJMtDhafjzqKKevnuQbr7
         UF3svIynmboxIF0cnKn6nu3CZ3X4xhYiK8tkXgLEQrb3WmWL7++KF7e1nELj5s8FZYl5
         KPLs4lQ/kt2UFsIEmeYyyXdcDD+iwkQpxRlaJwNi+eeGhjr+D/Hf450rocAeOfI5XvOi
         l/Lw1AebuOzYRBIKEnxgMnqKg632+rwh3Jw4SkcxgxD2ImbSn3JF4NY9hbFrFFktFSsx
         AMCC+ycqx0QEeFcCUMG2LUGoeUcQqv9L8fuiKHoMfAaMVUwufUbMUr+7f7V1NcA5vb4O
         y+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mmGaMP4xYq/Pz+AdbTpEleX3OSV7O/HdztwSvjvk9F0=;
        b=oHs/PiDDQHYNhiG2KapesE15/Zq2Q1uwUOlfVPk7EsxpsRKoMfyLVPgl4l8C2wgKVr
         8LE3phRUcmNdBU8yE1Ffjdv1BfkFYQs1dh8K958+OTyJ42mHCS+rQbMEEGB6zzM0KcR7
         LsuW1ORRKvwV4BLhZ7pVNiNtBScqsoxIiF//gaTqZ5up7gAvNpWyWP3KF7Rreb5pEOwC
         EIsUNmMSd4w0gsGmBpiC7AeIV+G7Mt69y2mcOaN3g5iSXUnC+WvCFlmhn6ZT2X4OqOEg
         vkKjJroo4Cg62Jp4jzp/Y6Svjkjm+4trfgK0PBrG9Sp1mGZ5ZVOO4OUMA32bO+kSMfT0
         SLqg==
X-Gm-Message-State: AJIora/RB+Gwrz4y7hdhZMX5S/405ymqBkbrZHrOwU8cydMoAeW5pf2J
        i54Inqgjka+J0DcBoBimh/6k8IAO77lSj3F5h3AReA==
X-Google-Smtp-Source: AGRyM1tTcJ0sUKCTosAVFkJmnimYbzxEk6I9sb6VcSxsSPTyLXdMFWh4Nf2mxfswHn/la0UCzxmE0tx0uahnqFYIDFo=
X-Received: by 2002:a17:906:739d:b0:722:e94a:24c5 with SMTP id
 f29-20020a170906739d00b00722e94a24c5mr44022927ejl.734.1657196367693; Thu, 07
 Jul 2022 05:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084226.472035-1-brgl@bgdev.pl> <20220628084226.472035-6-brgl@bgdev.pl>
 <20220705020937.GB6652@sol>
In-Reply-To: <20220705020937.GB6652@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Jul 2022 14:19:17 +0200
Message-ID: <CAMRc=Mec4C2RUvZjxc=6G6Nv0-Us91X-j-3jnNNGzE8MjrbCag@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 5, 2022 at 4:09 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

> > +PyDoc_STRVAR(chip_get_line_offset_from_name_doc,
> > +"Map a line's name to its offset within the chip.\n"
> > +"\n"
> > +"Args:\n"
> > +"  name:\n"
> > +"    Name of the GPIO line to map.\n"
> > +"\n"
> > +"Returns:\n"
> > +"  Line offset corresponding with the name or None if a line with given name\n"
> > +"  is not exposed by this chip.");
> > +
>
> It should throw if the name search fails.
>
> If name is already an int then just return the int.
> (to allow the method to be used as a mapping function on a mixed
> list.)  Though ironically the name isn't the best then.
> Perhaps just get_line_offset() or map_line_offset()?
>

Do you think we should change the C function name to
gpiod_chip_map_line_offset() too? And possibly make it parse strings
representing integers as well?

> [snip]
>
> > +static PyGetSetDef edge_event_getset[] = {
> > +     {
> > +             .name = "type",
> > +             .get = (getter)edge_event_get_type,
> > +             .doc = edge_event_get_type_doc,
> > +     },
> > +     {
> > +             .name = "timestamp_ns",
> > +             .get = (getter)edge_event_timestamp_ns,
> > +             .doc = edge_event_timestamp_ns_doc,
> > +     },
> > +     {
> > +             .name = "line_offset",
> > +             .get = (getter)edge_event_line_offset,
> > +             .doc = edge_event_line_offset_doc,
> > +     },
> > +     {
> > +             .name = "global_seqno",
> > +             .get = (getter)edge_event_global_seqno,
> > +             .doc = edge_event_global_seqno_doc,
> > +     },
> > +     {
> > +             .name = "line_seqno",
> > +             .get = (getter)edge_event_line_seqno,
> > +             .doc = edge_event_line_seqno_doc,
> > +     },
> > +     { }
> > +};
> > +
>
> Provide a helper to convert the timestamp_ns into a time.datetime.
> (for event_clock_realtime)
>
> [snip]
> > +static const struct exception_desc exceptions[] = {
> > +     {
> > +             .name = "ChipClosedError",
> > +             .base = "Exception",
> > +             .doc = "Error raised when an already closed chip is used.",
> > +     },
> > +     {
> > +             .name = "RequestReleasedError",
> > +             .base = "Exception",
> > +             .doc = "Error raised when a released request is used.",
> > +     },
> > +     {
> > +             .name = "BadMappingError",
> > +             .base = "Exception",
> > +             .doc = "Exception thrown when the core C library returns an invalid value for any of the line properties.",
> > +     },
>
> Name is too vague - a bad mapping could mean anything - including its own
> name ;-).
> How about "UnknownPropertyValueError"?  "unknown" rather than "invalid"
> as the likely cause is an updated C library.
> Or even just a ValueError might work.
>

I would like to make it clear it's a specific libgpiod error.
UnknownPropertyValueError works for me. I would probably need to
update the C++ version of this too.

> [snip]
> > +
> > +static PyGetSetDef info_event_getset[] = {
> > +     {
> > +             .name = "type",
> > +             .get = (getter)info_event_get_type,
> > +             .doc = info_event_get_type_doc,
> > +     },
> > +     {
> > +             .name = "timestamp_ns",
> > +             .get = (getter)info_event_timestamp_ns,
> > +             .doc = info_event_timestamp_ns_doc,
> > +     },
> > +     {
> > +             .name = "line_info",
> > +             .get = (getter)info_event_line_info,
> > +             .doc = info_event_line_info_doc,
> > +     },
> > +     { }
> > +};
> > +
>
> Provide a helper to convert timestamp_ns to time.datetime.
> This one is a bit trickier as the kernel only ever provides monotonic
> clock, so need to perform the monotonic -> realtime conversion.
> (for reference my proposed gpiowatch tool does this)
>

Should this be put into libgpiod C API directly maybe?

> [snip]
> > +PyDoc_STRVAR(line_config_set_props_default_doc,
> > +"Set the defaults for properties.\n"
> > +"\n"
> > +"Args:\n"
> > +"  direction:\n"
> > +"    Default direction.\n"
> > +"  edge_detection:\n"
> > +"    Default edge detection.\n"
> > +"  bias:\n"
> > +"    Default bias.\n"
> > +"  drive:\n"
> > +"    Default drive.\n"
> > +"  active_low:\n"
> > +"    Default active-low setting.\n"
> > +"  debounce_period:\n"
> > +"    Default debounce period.\n"
> > +"  event_clock:\n"
> > +"    Default event clock.\n"
> > +"  output_value:\n"
> > +"    Default output value.");
> > +
>
> How about merging the _default and _offset forms by adding an offsets
> kwarg?
> offsets=None (or unspecified) -> default
> offsets=int -> offset
> offsets=iterable -> offsets
>
> Off on a bit of a tangent... why should the end user care about
> defaults and overrides?
> For a higher level abstraction I'd prefer to see the whole "default"
> concept disappear in favour of the config for each line.  That would
> remove a lot of the complexity from the LineConfig interface.
> Though it would add complexity to the binding internals.
>

What would that look like (in python code) if I wanted to request 5
lines and use the same config for them?

> [snip]
> > +PyDoc_STRVAR(line_config_get_props_default_doc,
> > +"Get default values for a set of line properties.\n"
> > +"\n"
> > +"Args:\n"
> > +"  properties:\n"
> > +"    List of properties (gpiod.LineConfig.Property) for which to get default\n"
> > +"    values.\n"
> > +"\n"
> > +"Returns:\n"
> > +"  List of default values for properties specified in the argument list and\n"
> > +"  in the same order");
> > +
>
> As per the set, consider merging the _default and _offset forms by
> adding an offset kwarg.
>
> [snip]
>
> > +PyDoc_STRVAR(line_info_type_doc,
> > +"Line info object contains an immutable snapshot of a line's status.");
> > +
>
> Either "LineInfo" or "Immutable object containing..." as you use
> elsewhere (I'd go with the latter for consistency).
>
> [snip]
>
> > +     } else {
> > +             for (i = 0; i < num_values; i++) {
> > +                     offset = PyList_GetItem(offsets_obj, i);
> > +                     if (!offset) {
> > +                             PyMem_Free(values);
> > +                             PyMem_Free(offsets);
> > +                             return NULL;
> > +                     }
> > +
> > +                     offsets[i] = Py_gpiod_PyLongAsUnsignedInt(offset);
> > +                     if (PyErr_Occurred()){
>                                  ^ missing whitespace.
>
> > +                             PyMem_Free(values);
> > +                             PyMem_Free(offsets);
> > +                             return NULL;
> > +                     }
> > +             }
> > +     }
> > +
> > +     Py_BEGIN_ALLOW_THREADS;
> > +     ret = gpiod_line_request_get_values_subset(self->request, num_values,
> > +                                                offsets, values);
>
> [snip]
>
> > +static const PyCEnum_EnumDef line_enums[] = {
> > +     {
> > +             .name = "Value",
> > +             .values = value_enum_vals
> > +     },
> > +     {
> > +             .name = "Direction",
> > +             .values = direction_enum_vals
> > +     },
> > +     {
> > +             .name = "Bias",
> > +             .values = bias_enum_vals
> > +     },
> > +     {
> > +             .name = "Drive",
> > +             .values = drive_enum_vals
> > +     },
> > +     {
> > +             .name = "Edge",
> > +             .values = edge_enum_vals
> > +     },
> > +     {
> > +             .name = "Clock",
> > +             .values = event_clock_enum_vals
> > +     },
> > +     { }
> > +};
> > +
>
> Clock -> EventClock here and elsewhere
>
> [snip]
>
> > +static PyObject *
> > +make_line_cfg_kwargs(PyObject *direction, PyObject *edge_detection,
> > +                  PyObject *bias, PyObject *drive, PyObject *active_low,
> > +                  PyObject *debounce_period, PyObject *event_clock,
> > +                  PyObject *output_value, PyObject *output_values)
> > +{
> > +     static const char *const keys[] = {
> > +             "direction",
> > +             "edge_detection",
> > +             "bias",
> > +             "drive",
> > +             "active_low",
> > +             "debounce_period",
> > +             "event_clock",
> > +             "output_value",
> > +             "output_values",
> > +     };
> > +
> > +     PyObject *kwargs, *vals[9];
> > +     int ret, i;
> > +
> > +     vals[0] = direction;
> > +     vals[1] = edge_detection;
> > +     vals[2] = bias;
> > +     vals[3] = drive;
> > +     vals[4] = active_low;
> > +     vals[5] = debounce_period;
> > +     vals[6] = event_clock;
> > +     vals[7] = output_value;
> > +     vals[8] = output_values;
> > +
> > +     if (memcmp(vals, "\0\0\0\0\0\0\0\0\0", 9) == 0)
> > +             return NULL;
> > +
> > +     kwargs = PyDict_New();
> > +     if (!kwargs)
> > +             return NULL;
> > +
> > +     for (i = 0; i < 9; i ++) {
>                         ^ extra whitespace
>
> > +             if (!vals[i])
> > +                     continue;
> > +
> > +             ret = PyDict_SetItemString(kwargs, keys[i], vals[i]);
> > +             if (ret) {
> > +                     Py_DECREF(kwargs);
> > +                     return NULL;
> > +             }
> > +     }
> > +
> > +     return kwargs;
> > +}
> > +
>
> [snip]
>
> > +     res = PyObject_Call(method, args, line_cfg_kwargs);
> > +     Py_DECREF(args);
> > +     Py_DECREF(method);
> > +     if (!Py_IsNone(res)) {
> > +             Py_DECREF(res);
> > +             return NULL;
> > +     }
> > +
>
> As mentioned in a separate mail, Py_IsNone() requires Python 3.10, while
> the configure.ac allows 3.9.
>
> > +     Py_DECREF(res);
> > +
> > +     return line_cfg;
> > +}
> > +
> > +static PyObject *
> > +module_request_lines(PyObject *self, PyObject *args, PyObject *kwargs)
> > +{
> > +     static char *kwlist[] = {
> > +             "path",
> > +             "req_cfg",
> > +             "line_cfg",
> > +             "lines",
> > +             "direction",
> > +             "edge_detection",
> > +             "bias",
> > +             "drive",
> > +             "active_low",
> > +             "debounce_period",
> > +             "event_clock",
> > +             "output_value",
> > +             "output_values",
> > +             NULL
> > +     };
> > +
>
> My suggestion to provide a lines parameter here was actually a poor one,
> given the LineConfig only deals with offsets - which is totally reasonable
> as supporting line names in LineConfig would be complicated.
> I would prefer the two to be consistent, and so use offsets.
>

I disagree. In the module-wide request function we have the chip
already, we can map the names to offsets. It makes perfect sense to do
it implicitly here as a pythonic shorthand for opening the chip
manually and requesting lines separately. This function already got
improved a lot in my v3.

> If get_line_offset_from_name() was better for mapping (in the Python
> sense) then you could just use a list comprehension to convert a list of
> names/offsets into a list of offsets to pass in here.
>
> So I would change lines to offsets here and make
> get_line_offset_from_name() more useful for mapping (more on that where
> it is defined).
>
> > +     PyObject *path, *req_cfg = NULL, *line_cfg = NULL, *lines = NULL,
> > +              *direction = NULL, *edge_detection = NULL, *bias = NULL,
> > +              *drive = NULL, *active_low = NULL, *debounce_period = NULL,
> > +              *event_clock = NULL, *output_value = NULL,
> > +              *output_values = NULL, *dict, *chip, *req, *line_cfg_kwargs;
> > +     int ret;
> > +
> > +     ret = PyArg_ParseTupleAndKeywords(args, kwargs, "O|OO$OOOOOOOOOO",
> > +                                       kwlist, &path, &req_cfg, &line_cfg,
> > +                                       &lines, &direction, &edge_detection,
> > +                                       &bias, &drive, &active_low,
> > +                                       &debounce_period, &event_clock,
> > +                                       &output_value, &output_values);
> > +     if (!ret)
> > +             return NULL;
> > +
> > +     dict = PyModule_GetDict(self);
> > +     if (!dict)
> > +             return NULL;
> > +
> > +     chip = make_chip(dict, path);
> > +     if (!chip)
> > +             return NULL;
> > +
> > +     req_cfg = make_req_cfg(dict, chip, req_cfg, lines);
> > +     if (!req_cfg) {
> > +             close_chip(chip);
> > +             return NULL;
> > +     }
> > +
>
> What if lines is None or empty?
>
> A failed name -> offset mapping in make_req_cfg() and set_lines() results
> in a returned NULL here?  Shouldn't it provide a meaningful error or throw
> an exception?
> Change to passing in offsets and this problem goes away.
>

Yep, fixed that in v3 already.

> [snip]
>
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -198,7 +198,7 @@ AM_CONDITIONAL([WITH_BINDINGS_PYTHON], [test "x$with_bindings_python" = xtrue])
> >
> >  if test "x$with_bindings_python" = xtrue
> >  then
> > -     AM_PATH_PYTHON([3.0], [],
> > +     AM_PATH_PYTHON([3.9], [],
>
> Given this requirement, make sure it compiles with Python 3.9.
>
> >               [AC_MSG_ERROR([python3 not found - needed for python bindings])])
> >       AC_CHECK_PROG([has_python_config], [python3-config], [true], [false])
> >       if test "x$has_python_config" = xfalse
> > @@ -243,6 +243,7 @@ AC_CONFIG_FILES([Makefile
> >                bindings/cxx/examples/Makefile
> >                bindings/cxx/tests/Makefile
> >                bindings/python/Makefile
> > +              bindings/python/enum/Makefile
> >                bindings/python/examples/Makefile
> >                bindings/python/tests/Makefile
> >                man/Makefile])
> > --
> > 2.34.1
> >
>
> Nothing major really.
> I would personally like to have a slightly higher level of abstraction,
> but given you are going for a minimalist wrapper around libgpiod, it
> seems totally reasonable.
>
> Cheers,
> Kent.

Bart
