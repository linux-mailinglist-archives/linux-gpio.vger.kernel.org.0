Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D88A60E0AF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 14:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbiJZMcx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 08:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233506AbiJZMcv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 08:32:51 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92E973C35
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 05:32:47 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id 189so13078973vsi.9
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=33a/iL2qQooeR8pQIv86X4dLsad5WzkjVbkAu5if/hM=;
        b=Z/6I4h5x9lkuU9wyoFWl2aS2eD3Op+ZVEMQgKTEGKZu7EsB+Cd41YpSaMKNYBHBGMM
         avmhF4wWTX9x6sFrFuKQ1yfs2tBhJgHszDGIZiuX7cNQNcjdpYffuBnqKggp/y/kZLdk
         YOWlxpRPyf4vGLKGBu8Y2rJq0kbgp9UihIcAKKSeNA9vJtRO80QlvGLksagnbRGF5uLn
         hT03f94OSW7Hj53T2untedpsbPZn9DiY7DatpuysDRVhi6soeLIaVYpAYzSVrYSYZIbN
         kae2yjS3G7/HYDAg5AWOUTU2SQ5QK5sQ5+8SFnQanJyLlKeNGb7sj+7t9eElEbnzeKg1
         3zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33a/iL2qQooeR8pQIv86X4dLsad5WzkjVbkAu5if/hM=;
        b=oXBgX1PFrhw12pinR6ONBkvdE3eFRTfhCTvoCh2Riax1WUSH3fIxzCyJPvnN7hXNV7
         5fqMFDqls39Fl8KcMsLvVtnoeFKdLTni2J2B+f/H0TlOcoC4ILtGKf6C6/v7/0y8YWPc
         VpEoZk9Ig5uaWMDXAEHa21rHyC4ICCyu8thVU41AAtavIh5T0tU4QqIWaBc8j6dt3abX
         CRuQD2puzGImYL32zUhEsWaNeLqRj3J3VbCdpxeaJlEZq5ZXvl6PRKIeVW/cX8Rm/0+G
         sJMzA33bf6svVZsGARnH01SE6WsF5Z5qNyxnxcH8dLO+Co669iFWIDFQdEtjuJCvwjJj
         D6rQ==
X-Gm-Message-State: ACrzQf0WWjy+5oT6CPbkO7qQhsAvsQW4wfTPVvE6DlJNuko6MrcrT6Sp
        geewjmxaTGG9A1ExwLtFu7WFGEvOxvOmhBEqkIPA4Q==
X-Google-Smtp-Source: AMsMyM432JRA0DFP6taydZLS0IHpLXctI/43unTL+eaxvzFu6dI66orJDiYchGynxDu/61S1KoHUDz2da0saOeH8jNo=
X-Received: by 2002:a67:ac0c:0:b0:3a9:e899:3b9b with SMTP id
 v12-20020a67ac0c000000b003a9e8993b9bmr18335794vse.9.1666787566793; Wed, 26
 Oct 2022 05:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221007145521.329614-1-brgl@bgdev.pl> <20221007145521.329614-5-brgl@bgdev.pl>
 <Y0eBonEvVclIBQS8@sol>
In-Reply-To: <Y0eBonEvVclIBQS8@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 26 Oct 2022 14:32:35 +0200
Message-ID: <CAMRc=Mf77zXc8_F_nsjyMMoCh6wnO10Lv2k22cS3N5KQ142Dcw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v3 4/4] bindings: python: implement python
 bindings for libgpiod v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 13, 2022 at 5:10 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Oct 07, 2022 at 04:55:21PM +0200, Bartosz Golaszewski wrote:
> > This adds python bindings for libgpiod v2. As opposed to v1, they are
> > mostly written in python with just low-level elements written in C and
> > interfacing with libgpiod.so.
> >
> > We've also added setup.py which will allow to use pip for managing the
> > bindings and split them into a separate meta-openembedded recipe.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>

<snip - all those cut are done>

> Should ids fallback to being interpreted as ints if they can't be
> found as strings?  Why not leave that call to the user?
> If they aren't sure they can try it as a string, and if that fails try
> it as an int.
> (I realise this is the reverse argument of my comment in the examples
> patch btw - playing devil's advocate here - and there.)
>

I've thought about it and I think that the current behavior makes
sense in Python where things should "just work" out of the box. If
anything, we can add a flag no_implicit_conv or something.

> Is the range check on ints necessary? The kernel will do that when you
> make the call - what is the benefit of doing it here?

That way we won't make it seem like we correctly mapped the name?

> In which case why accept int at all?  Which would make the function
> offset_from_name() - just like the C.
>

This was your idea in the first place. :)

The reasoning was - it's python, so let's use its dynamic typing and
make the interface pretty lax.

> > +        """
> > +        self._check_closed()
> > +
> > +        if not isinstance(id, int):
> > +            try:
> > +                return self._chip.map_line(id)
> > +            except OSError as ex:
> > +                if ex.errno == ENOENT:
> > +                    try:
> > +                        offset = int(id)
> > +                    except ValueError:
> > +                        raise ex
> > +                else:
> > +                    raise ex
> > +        else:
> > +            offset = id
> > +
> > +        if offset >= self.get_info().num_lines:
> > +            raise ValueError("line offset of out range")
> > +
> > +        return offset
> > +
> > +    def _get_line_info(self, line: Union[int, str], watch: bool) -> LineInfo:
> > +        self._check_closed()
>
> Wrt the _check_closed(), what is to prevent another thread closing the
> chip here, and causing the next line to segfault?
>

Nothing, but we don't guarantee thread-safety like you mentioned in
your response below.

> And self.map_line(line) can release the GIL so all bets are off even if
> you assume cooperative multitasking - not that you can assume that.
>

Yes but that's up to the user to assure correct concurrent access to
libgpiod objects. Are there any benefits of trying to assure
thread-safety in the library code?

<snip>

> > +
> > +    def request_lines(
> > +        self,
> > +        config: dict[tuple[Union[int, str]], Optional[LineSettings]],
> > +        consumer: Optional[str] = None,
> > +        event_buffer_size: Optional[int] = None,
> > +    ) -> LineRequest:
> > +        """
> > +        Request a set of lines for exclusive usage.
> > +
> > +        Args:
> > +          config:
> > +            Dictionary mapping offsets or names (or tuples thereof) to
> > +            LineSettings. If None is passed as the value of the mapping,
> > +            default settings are used.
>
> What are the semantics for lines being repeated in the dict keys (which
> is possible as the keys are tuples, and also because the line can be
> identified by offset or name)?
>

Good point, I will clear that up in the docs and add test cases.

> > +          consumer:
> > +            Consumer string to use for this request.
> > +          event_buffer_size:
> > +            Size of the kernel edge event buffer to configure for this request.
> > +
> > +        Returns:
> > +          New LineRequest object.
> > +        """
> > +        self._check_closed()
> > +
> > +        line_cfg = _ext.LineConfig()
> > +
> > +        for lines, settings in config.items():
> > +            offsets = list()
> > +            name_map = dict()
> > +            offset_map = dict()
> > +
> > +            if isinstance(lines, int) or isinstance(lines, str):
> > +                lines = (lines,)
> > +
> > +            for line in lines:
> > +                offset = self.map_line(line)
> > +                offsets.append(offset)
> > +                if isinstance(line, str):
> > +                    name_map[line] = offset
> > +                    offset_map[offset] = line
>
> Use list comprehensions instead of the for loop?
>

Not sure it's worth it - we would essentially iterate thrice to fill
in every container here?

> > +
> > +            if settings is None:
> > +                settings = LineSettings()
> > +
>                settings = settings or LineSettings()
>
> Would use that directly below if it would fit in the line.
>
> Rename _line_settings_to_ext_line_settings to _line_settings_to_ext,
> as the second line_settings is redundant?  Then it might fit.
>

Done

> > +            line_cfg.add_line_settings(
> > +                offsets, _line_settings_to_ext_line_settings(settings)
> > +            )
> > +
> > +        req_internal = self._chip.request_lines(line_cfg, consumer, event_buffer_size)
> > +        request = LineRequest(req_internal)
> > +
> > +        request._offsets = req_internal.offsets
> > +        request._name_map = name_map
> > +        request._offset_map = offset_map
> > +
> > +        request._lines = list()
> > +        for off in request.offsets:
> > +            request._lines.append(offset_map[off] if off in offset_map else off)
>
> Again, prefer to use list comprehensions to translate lists like this.
>

Done

<snip>

> > +
> > +static int
> > +chip_init(chip_object *self, PyObject *args, PyObject *Py_UNUSED(ignored))
> > +{
> > +     char *path;
> > +     int ret;
> > +
> > +     ret = PyArg_ParseTuple(args, "s", &path);
> > +     if (!ret)
> > +             return -1;
> > +
> > +     Py_BEGIN_ALLOW_THREADS;
> > +     self->chip = gpiod_chip_open(path);
> > +     Py_END_ALLOW_THREADS;
>
> Is the assignment to self->chip while not holding the GIL (between the
> BEGIN and END) safe?
> To be sure, assign to a local then assign that to self->chip after the END.
>

Good point.

> Similarly other BEGIN/END blocks should only access locals.
> And even then you probably need locks to prevent threads trampling each
> other, but the locks need the GIL, IIUC.
>
> So I suspect your chip._check_closed()s need to be more like
>   with chip._lock()
>

I agree that the C code should not crash - so it makes sense to not
assign self->chip with GIL released. But for thread-safety in general
- I don't think the module should care about it. Just like C and C++
libs leave it to the user. The only thing we should care about is not
keeping any global state that could cause problems in multithreaded
apps.

> Similarly the other object validity checks.
>
> > +     if (!self->chip) {
> > +             Py_gpiod_SetErrFromErrno();
> > +             return -1;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void chip_finalize(chip_object *self)
> > +{
> > +     if (self->chip)
> > +             PyObject_CallMethod((PyObject *)self, "close", "");
> > +}
> > +
> > +static PyObject *chip_path(chip_object *self, void *Py_UNUSED(ignored))
> > +{
> > +     return PyUnicode_FromString(gpiod_chip_get_path(self->chip));
> > +}
> > +
> > +static PyObject *chip_fd(chip_object *self, void *Py_UNUSED(ignored))
> > +{
> > +     return PyLong_FromLong(gpiod_chip_get_fd(self->chip));
> > +}
> > +
> > +static PyGetSetDef chip_getset[] = {
> > +     {
> > +             .name = "path",
> > +             .get = (getter)chip_path,
> > +     },
> > +     {
> > +             .name = "fd",
> > +             .get = (getter)chip_fd,
> > +     },
> > +     { }
> > +};
> > +
> > +static PyObject *chip_close(chip_object *self, PyObject *Py_UNUSED(ignored))
> > +{
> > +     Py_BEGIN_ALLOW_THREADS;
> > +     gpiod_chip_close(self->chip);
> > +     Py_END_ALLOW_THREADS;
> > +     self->chip = NULL;
> > +
> > +     Py_RETURN_NONE;
> > +}
> > +
> > +static PyObject *chip_get_info(chip_object *self, PyObject *Py_UNUSED(ignored))
> > +{
> > +     struct gpiod_chip_info *info;
> > +     PyObject *type, *ret;
> > +
> > +     type = Py_gpiod_GetGlobalType("ChipInfo");
> > +     if (!type)
> > +             return NULL;
> > +
> > +     info = gpiod_chip_get_info(self->chip);
> > +     if (!info)
> > +             return PyErr_SetFromErrno(PyExc_OSError);
> > +
> > +      ret = PyObject_CallFunction(type, "ssI",
> > +                                  gpiod_chip_info_get_name(info),
> > +                                  gpiod_chip_info_get_label(info),
> > +                                  gpiod_chip_info_get_num_lines(info));
> > +      gpiod_chip_info_free(info);
> > +      return ret;
> > +}
> > +
> > +static PyObject *make_line_info(struct gpiod_line_info *info)
> > +{
> > +     PyObject *type;
> > +
> > +     type = Py_gpiod_GetGlobalType("LineInfo");
> > +     if (!type)
> > +             return NULL;
> > +
> > +     return PyObject_CallFunction(type, "IsOsiOiiiiOi",
>                                                    ^
>                                        "IsOsiOiiiiOk"
>
> debounce_period_us is an unsigned long, not int.
>

Good catch.

<snip>

> > +
> > +static int set_int_prop(struct gpiod_line_settings *settings, int val,
> > +                     int (*func)(struct gpiod_line_settings *, int))
> > +{
> > +     int ret;
> > +
> > +     ret = func(settings, val);
> > +     if (ret) {
> > +             Py_gpiod_SetErrFromErrno();
> > +             return -1;
> > +     }
> > +
>
> Since the ret value is never used, skip the ret and just test the func
> return directly?
>
> Similarly elsewhere.
>

This is just for consistency. It looks better and clearer IMO.

> > +     return 0;
> > +}
> > +
> > +static int
> > +line_settings_init(line_settings_object *self, PyObject *args, PyObject *kwargs)
> > +{
> > +     static char *kwlist[] = {
> > +             "direction",
> > +             "edge_detection",
> > +             "bias",
> > +             "drive",
> > +             "active_low",
> > +             "debounce_period",
> > +             "event_clock",
> > +             "output_value",
> > +             NULL
> > +     };
> > +
> > +     int direction, edge, bias, drive, active_low, event_clock, output_value,
> > +         ret;
> > +     unsigned long debounce_period;
> > +
> > +     ret = PyArg_ParseTupleAndKeywords(args, kwargs, "IIIIpdII", kwlist,
>                                                           ^
>                                                      IIIIpkII
>
> d is a double, k is an unsigned long
>

Done

<snip!>

> > +static PyObject *request_offsets(request_object *self, void *Py_UNUSED(ignored))
> > +{
> > +     PyObject *lines, *line;
> > +     unsigned int *offsets;
> > +     size_t num_lines, i;
> > +     int ret;
> > +
> > +     num_lines = gpiod_line_request_get_num_lines(self->request);
> > +
> > +     offsets = PyMem_Calloc(num_lines, sizeof(unsigned int));
> > +     if (!offsets)
> > +             return PyErr_NoMemory();
> > +
> > +     gpiod_line_request_get_offsets(self->request, offsets);
> > +
> > +     lines = PyList_New(num_lines);
> > +     if (!lines) {
> > +             PyMem_Free(offsets);
> > +             return NULL;
> > +     }
> > +
> > +     for (i = 0; i < num_lines; i++) {
> > +             line = PyLong_FromUnsignedLong(offsets[i]);
> > +             if (!lines) {
>                  ^
> Should be line.
>

Thanks!

<snip>

>
> A new buffer every time?
> Maybe cache it in the request_object for next time?
>

I was thinking about it and then forgot, thanks!

> > +     Py_BEGIN_ALLOW_THREADS;
> > +     ret = gpiod_line_request_read_edge_event(self->request,
> > +                                              buffer, max_events);
> > +     Py_END_ALLOW_THREADS;
> > +     if (ret < 0) {
> > +             gpiod_edge_event_buffer_free(buffer);
> > +             return NULL;
> > +     }
> > +
> > +     num_events = ret;
> > +
> > +     events = PyList_New(num_events);
> > +     if (!events) {
> > +             gpiod_edge_event_buffer_free(buffer);
> > +             return NULL;
> > +     }
> > +
> > +     for (i = 0; i < num_events; i++) {
> > +             event = gpiod_edge_event_buffer_get_event(buffer, i);
> > +             if (!event) {
> > +                     gpiod_edge_event_buffer_free(buffer);
> > +                     Py_DECREF(events);
> > +                     return NULL;
> > +             }
> > +
> > +             event_obj = PyObject_CallFunction(type, "iKiii",
> > +                             gpiod_edge_event_get_event_type(event),
> > +                             gpiod_edge_event_get_timestamp_ns(event),
> > +                             gpiod_edge_event_get_line_offset(event),
> > +                             gpiod_edge_event_get_global_seqno(event),
> > +                             gpiod_edge_event_get_line_seqno(event));
> > +             if (!event_obj) {
> > +                     gpiod_edge_event_buffer_free(buffer);
> > +                     Py_DECREF(events);
> > +                     return NULL;
> > +             }
> > +
> > +             ret = PyList_SetItem(events, i, event_obj);
> > +             if (ret) {
> > +                     gpiod_edge_event_buffer_free(buffer);
> > +                     Py_DECREF(event_obj);
> > +                     Py_DECREF(events);
> > +                     return NULL;
> > +             }
> > +     }
> > +
> > +     gpiod_edge_event_buffer_free(buffer);
> > +
> > +     return events;
> > +}
> > +
> > +static PyMethodDef request_methods[] = {
> > +     {
> > +             .ml_name = "release",
> > +             .ml_meth = (PyCFunction)request_release,
> > +             .ml_flags = METH_NOARGS,
> > +     },
> > +     {
> > +             .ml_name = "get_values",
> > +             .ml_meth = (PyCFunction)request_get_values,
> > +             .ml_flags = METH_VARARGS,
> > +     },
> > +     {
> > +             .ml_name = "set_values",
> > +             .ml_meth = (PyCFunction)request_set_values,
> > +             .ml_flags = METH_VARARGS,
> > +     },
> > +     {
> > +             .ml_name = "reconfigure_lines",
> > +             .ml_meth = (PyCFunction)request_reconfigure_lines,
> > +             .ml_flags = METH_VARARGS,
> > +     },
> > +     {
> > +             .ml_name = "read_edge_event",
> > +             .ml_meth = (PyCFunction)request_read_edge_event,
> > +             .ml_flags = METH_VARARGS,
> > +     },
> > +     { }
> > +};
> > +
> > +PyTypeObject request_type = {
> > +     PyVarObject_HEAD_INIT(NULL, 0)
> > +     .tp_name = "gpiod._ext.Request",
> > +     .tp_basicsize = sizeof(request_object),
> > +     .tp_flags = Py_TPFLAGS_DEFAULT,
> > +     .tp_new = PyType_GenericNew,
> > +     .tp_init = (initproc)request_init,
> > +     .tp_finalize = (destructor)request_finalize,
> > +     .tp_dealloc = (destructor)Py_gpiod_dealloc,
> > +     .tp_getset = request_getset,
> > +     .tp_methods = request_methods,
> > +};
> > +
> > +PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request *request)
> > +{
> > +     request_object *req_obj;
> > +     unsigned int *offsets;
> > +     size_t num_lines;
> > +     int *values;
> > +
> > +     num_lines = gpiod_line_request_get_num_lines(request);
> > +
> > +     req_obj = PyObject_New(request_object, &request_type);
> > +     if (!req_obj)
> > +             return NULL;
> > +
> > +     offsets = PyMem_Calloc(num_lines, sizeof(unsigned int));
> > +     if (!offsets) {
> > +             Py_DECREF(req_obj);
> > +             return NULL;
> > +     }
> > +
> > +     values = PyMem_Calloc(num_lines, sizeof(int));
> > +     if (!values) {
> > +             PyMem_Free(offsets);
> > +             Py_DECREF(req_obj);
> > +             return NULL;
> > +     }
> > +
> > +     req_obj->request = request;
> > +     req_obj->offsets = offsets;
> > +     req_obj->values = values;
> > +     req_obj->num_lines = num_lines;
> > +
> > +     return (PyObject *)req_obj;
> > +}
> > diff --git a/bindings/python/gpiod/line_info.py b/bindings/python/gpiod/line_info.py
> > new file mode 100644
> > index 0000000..9a6c9bf
> > --- /dev/null
> > +++ b/bindings/python/gpiod/line_info.py
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: LGPL-2.1-or-later
> > +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > +
> > +from . import _ext
> > +from dataclasses import dataclass
> > +from datetime import timedelta
> > +from gpiod.line import Direction, Bias, Drive, Edge, Clock
> > +
> > +
> > +@dataclass(frozen=True, init=False, repr=False)
> > +class LineInfo:
> > +    """
> > +    Snapshot of a line's status.
> > +    """
> > +
> > +    offset: int
> > +    name: str
> > +    used: bool
> > +    consumer: str
> > +    direction: Direction
> > +    active_low: bool
> > +    bias: Bias
> > +    drive: Drive
> > +    edge_detection: Edge
> > +    event_clock: Clock
> > +    debounced: bool
>
> I've probably asked this before, but does debounced differ from
> not debounce_period?
>

Nope, just consistency with the rest of tree. I'll think whether it's
really useful to not have it.

<snip>

> > +    def __init__(self, req: _ext.Request):
> > +        """
> > +        DON'T USE
> > +
> > +        LineRequest objects can only be instantiated by a Chip parent. This is
> > +        not part of stable API.
> > +        """
> > +        self._req = req
> > +
> > +    def __bool__(self) -> bool:
> > +        """
> > +        Boolean conversion for GPIO line requests.
> > +
> > +        Returns:
> > +          True if the request is live and False if it's been released.
> > +        """
> > +        return True if self._req else False
>
>            return self._req

But this will not convert to bool. The typing hint is just it - a
hint. I would be returning the internal request object.

>
> > +
> > +    def __enter__(self):
> > +        """
> > +        Controlled execution enter callback.
> > +        """
> > +        self._check_released()
> > +        return self
> > +
> > +    def __exit__(self, exc_type, exc_value, traceback):
> > +        """
> > +        Controlled execution exit callback.
> > +        """
> > +        self.release()
> > +
> > +    def _check_released(self) -> None:
> > +        if not self._req:
> > +            raise RequestReleasedError()
> > +
> > +    def release(self) -> None:
> > +        """
> > +        Release this request and free all associated resources. The object must
> > +        not be used after a call to this method.
> > +        """
> > +        self._check_released()
> > +        self._req.release()
> > +        self._req = None
> > +
> > +    def get_value(self, line: Union[int, str]) -> Value:
> > +        """
> > +        Get a single GPIO line value.
> > +
> > +        Args:
> > +          line:
> > +            Offset or name of the line to get value for.
> > +
> > +        Returns:
> > +          Logical value of the line.
> > +        """
> > +        return self.get_values([line])[0]
> > +
> > +    def get_values(
> > +        self, lines: Optional[Iterable[Union[int, str]]] = None
> > +    ) -> list[Value]:
> > +        """
> > +        Get values of a set of GPIO lines.
> > +
> > +        Args:
> > +          lines:
> > +            List of names or offsets of GPIO lines to get values for. Can be
> > +            None in which case all requested lines will be read.
> > +
> > +        Returns:
> > +          List of logical line values.
> > +        """
> > +        self._check_released()
> > +
> > +        if lines is None:
> > +            lines = self._lines
>
> What if lines is empty?  Is that equivalent to None, or an error?
> If the former...
>
>            lines = lines or self._lines
>
> either here or where used below (if that changed to a list comprehension)
>
> > +
> > +        offsets = [None] * len(lines)
> > +
> > +        for i, line in enumerate(lines):
> > +            if isinstance(line, str):
> > +                if line not in self._name_map:
> > +                    raise ValueError("unknown line name: {}".format(line))
> > +
> > +                offsets[i] = self._name_map[line]
> > +            else:
> > +                offsets[i] = line
> > +
>
> I would do this with a list comprehension and a helper function to do
> the id to offset mapping.  i.e.
>

Used list and dict comprehensions where possible.

<snip>

>
> Ok, the API is much nicer than the previous versions, so that is all
> good, given some clarification on the config semantics.
>
> Other than the couple of PyArg_ParseTupleAndKeywords issues,
> the other few minor bugs, and my obvious preference for using list
> comprehensions to build lists, the big sticking point for me is thread
> safety.
> I'm not convinced your current approach is thread safe, so convince me,
> either by proving me wrong or providing another solution.
> Hopefully I'm wrong.
>

It's not thread-safe. Why would it be? What if you use gpiod and a
module_x which also uses gpiod internally? Then you lock some mutex in
gpiod and module_x deadlocks with the same mutex? It should be left to
the user to handle threads.

Thanks a lot for the thorough review. v4 will be going out shortly!

Bart

> Cheers,
> Kent.
