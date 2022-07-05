Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8E915660FA
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 04:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbiGECJu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 22:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiGECJt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 22:09:49 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5198E11C02
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jul 2022 19:09:44 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id l12so4474518plk.13
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jul 2022 19:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lW1hbb/gXr/iYpFL9bp0+IAxoWX75u3Q5/Se1F/1BG8=;
        b=NDWXhj01g+QKcV1mXlX4I+KlJ7lXi+UO9dbafPKNCYLnwJr7Z6oz6nqO5UrldfWfm/
         2w++Aagpks+blIEEISR71Hbgg4UhJFSXPK69QDFz6oY+0eM+8xWEAM1r20N+UyM8PZZS
         HInDPlDziRDQArm2cvHQ3oUAQ9JYMz0WnWXik/Odcr8d/MNaB7R7nqMDQqbkCNlAlGGG
         /J768QbuBppqHb+CMUuBIgSIJshh8ZAbtF8vNm0Oh3NnRNurLrspTmhWxhxFcoWTQmtx
         ub5To8XFvDn7GTTstWqHnzXkf5WCfpIKjWbcRQGXUfcJzJcFevFCsi3e5vYOUCfSLbyU
         ia3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lW1hbb/gXr/iYpFL9bp0+IAxoWX75u3Q5/Se1F/1BG8=;
        b=xHHMPC5x4dNxMI8rIiPx8jHhu/WIYQVFGvHjGIZ3Q5RNSGBWjKjBg8E9dmiDI2jwWL
         IdFZFudUkEoymzRq9mynkc93fu+hXbybwgUll+6xLNGRRUTBqGNP+k//a86iU1NOiDN0
         Q0KGMxaVGy6b6Hex8DhSnOaPV89aQGKnq33fCb7+bRVWmz0aLHF6XPorRVVcOFXnRBZv
         iA2CLAbjtROMb79pzl5EaXCyQDjSti0MCIEXenEzr7rfsmk/i6EpVN2VjxYiSoX1JEGI
         g7LpsCKHUQ3e0qP0CQ5u/3P/PNLbMVyPRD7JrGRadShzeGFzkAKsQjGnsFSQFHvcNonS
         zJ4A==
X-Gm-Message-State: AJIora9C9zdrNZ0gvsSDqn0lNw4sE1xt+s+HcBrNf/tOzdLFX2uaIIbR
        5dbgYZg/gN5wU8RHLALKTS8=
X-Google-Smtp-Source: AGRyM1tEzc4gQ6Lf6kEVvHnzNjANAa39j3oOjfBJ5ibItX8OaA66m6RSgPt63zg0uiD83aHd+UwB6A==
X-Received: by 2002:a17:90b:38c3:b0:1ec:cb07:f216 with SMTP id nn3-20020a17090b38c300b001eccb07f216mr41405932pjb.168.1656986983637;
        Mon, 04 Jul 2022 19:09:43 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902db0b00b0016bef6f6903sm614418plx.72.2022.07.04.19.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 19:09:42 -0700 (PDT)
Date:   Tue, 5 Jul 2022 10:09:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
Message-ID: <20220705020937.GB6652@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628084226.472035-6-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golaszewski wrote:
> This is the implementation of the new python API for libgpiod v2.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  bindings/python/.gitignore          |    1 +
>  bindings/python/Makefile.am         |   40 +
>  bindings/python/chip-info.c         |  126 +++
>  bindings/python/chip.c              |  606 ++++++++++++
>  bindings/python/edge-event-buffer.c |  330 +++++++
>  bindings/python/edge-event.c        |  191 ++++
>  bindings/python/exception.c         |  182 ++++
>  bindings/python/info-event.c        |  175 ++++
>  bindings/python/line-config.c       | 1373 +++++++++++++++++++++++++++
>  bindings/python/line-info.c         |  286 ++++++
>  bindings/python/line-request.c      |  803 ++++++++++++++++
>  bindings/python/line.c              |  239 +++++
>  bindings/python/module.c            |  557 +++++++++++
>  bindings/python/module.h            |   58 ++
>  bindings/python/request-config.c    |  320 +++++++
>  configure.ac                        |    3 +-
>  16 files changed, 5289 insertions(+), 1 deletion(-)
>  create mode 100644 bindings/python/.gitignore
>  create mode 100644 bindings/python/Makefile.am
>  create mode 100644 bindings/python/chip-info.c
>  create mode 100644 bindings/python/chip.c
>  create mode 100644 bindings/python/edge-event-buffer.c
>  create mode 100644 bindings/python/edge-event.c
>  create mode 100644 bindings/python/exception.c
>  create mode 100644 bindings/python/info-event.c
>  create mode 100644 bindings/python/line-config.c
>  create mode 100644 bindings/python/line-info.c
>  create mode 100644 bindings/python/line-request.c
>  create mode 100644 bindings/python/line.c
>  create mode 100644 bindings/python/module.c
>  create mode 100644 bindings/python/module.h
>  create mode 100644 bindings/python/request-config.c
> 
> diff --git a/bindings/python/.gitignore b/bindings/python/.gitignore
> new file mode 100644
> index 0000000..bee8a64
> --- /dev/null
> +++ b/bindings/python/.gitignore
> @@ -0,0 +1 @@
> +__pycache__
> diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
> new file mode 100644
> index 0000000..3f7ee5f
> --- /dev/null
> +++ b/bindings/python/Makefile.am
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +

It's 2022?

> +pyexec_LTLIBRARIES = gpiod.la
> +
> +gpiod_la_SOURCES = \
> +	chip.c \
> +	chip-info.c \
> +	edge-event.c \
> +	edge-event-buffer.c \
> +	exception.c \
> +	info-event.c \
> +	line.c \
> +	line-config.c \
> +	line-info.c \
> +	line-request.c \
> +	module.c \
> +	module.h \
> +	request-config.c
> +
> +gpiod_la_CFLAGS = -I$(top_srcdir)/include/
> +gpiod_la_CFLAGS += -Wall -Wextra -g -std=gnu89 $(PYTHON_CPPFLAGS)
> +gpiod_la_CFLAGS += -include $(top_builddir)/config.h
> +gpiod_la_LDFLAGS = -module -avoid-version
> +gpiod_la_LIBADD = $(top_builddir)/lib/libgpiod.la $(PYTHON_LIBS)
> +gpiod_la_LIBADD += $(top_builddir)/bindings/python/enum/libpycenum.la
> +
> +SUBDIRS = enum .
> +
> +if WITH_TESTS
> +
> +SUBDIRS += tests
> +
> +endif
> +
> +if WITH_EXAMPLES
> +
> +SUBDIRS += examples
> +
> +endif
> diff --git a/bindings/python/chip-info.c b/bindings/python/chip-info.c
> new file mode 100644
> index 0000000..e48cf74
> --- /dev/null
> +++ b/bindings/python/chip-info.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: LGPL-2.1-or-later
> +// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +#include "module.h"
> +
> +typedef struct {
> +	PyObject_HEAD;
> +	struct gpiod_chip_info *info;
> +} chip_info_object;
> +
> +static int chip_info_init(PyObject *Py_UNUSED(self),
> +			  PyObject *Py_UNUSED(ignored0),
> +			  PyObject *Py_UNUSED(ignored1))
> +{
> +	PyErr_SetString(PyExc_TypeError,
> +			"cannot create 'gpiod.ChipInfo' instances");
> +	return -1;
> +}
> +

As you may've noticed, I tend to make use of the 100 character wrap
limit these days, so wrapping at 80 feels premature.

> +static void chip_info_finalize(chip_info_object *self)
> +{
> +	if (self->info)
> +		gpiod_chip_info_free(self->info);
> +}
> +
> +PyDoc_STRVAR(chip_info_name_doc,
> +"Name of the chip as represented in the kernel.");
> +
> +static PyObject *chip_info_name(chip_info_object *self,
> +				void *Py_UNUSED(ignored))
> +{
> +	return PyUnicode_FromString(gpiod_chip_info_get_name(self->info));
> +}
> +
> +PyDoc_STRVAR(chip_info_label_doc,
> +"Label of the chip as represented in the kernel.");
> +
> +static PyObject *chip_info_label(chip_info_object *self,
> +				 void *Py_UNUSED(ignored))
> +{
> +	return PyUnicode_FromString(gpiod_chip_info_get_label(self->info));
> +}
> +
> +PyDoc_STRVAR(chip_info_num_lines_doc,
> +"Number of GPIO lines exposed by the chip.");
> +
> +static PyObject *chip_info_num_lines(chip_info_object *self,
> +				     void *Py_UNUSED(ignored))
> +{
> +	return PyLong_FromUnsignedLong(
> +			gpiod_chip_info_get_num_lines(self->info));
> +}
> +
> +static PyGetSetDef chip_info_getset[] = {
> +	{
> +		.name = "name",
> +		.get = (getter)chip_info_name,
> +		.doc = chip_info_name_doc,
> +	},
> +	{
> +		.name = "label",
> +		.get = (getter)chip_info_label,
> +		.doc = chip_info_label_doc,
> +	},
> +	{
> +		.name = "num_lines",
> +		.get = (getter)chip_info_num_lines,
> +		.doc = chip_info_num_lines_doc
> +	},
> +	{ }
> +};
> +
> +static PyObject *chip_info_str(PyObject *self)
> +{
> +	PyObject *name, *label, *num_lines, *str = NULL;
> +
> +	name = PyObject_GetAttrString(self, "name");
> +	label = PyObject_GetAttrString(self, "label");
> +	num_lines = PyObject_GetAttrString(self, "num_lines");
> +	if (!name || !label || !num_lines)
> +		goto out;
> +
> +	str = PyUnicode_FromFormat("<gpiod.ChipInfo name=\"%S\" label=\"%S\" num_lines=%S>",
> +				   name, label, num_lines);
> +
> +out:
> +	Py_XDECREF(name);
> +	Py_XDECREF(label);
> +	Py_XDECREF(num_lines);
> +	return str;
> +}
> +
> +PyDoc_STRVAR(chip_info_type_doc,
> +"Chip info object contains an immutable snapshot of a chip's status.");

Either "ChipInfo" or "Immutable object containing..." as you use
elsewhere (I'd go with the latter for consistency).

[snip]
> +
> +PyDoc_STRVAR(chip_wait_info_event_doc,
> +"Wait for line status change events on any of the watched lines on the chip.\n"
> +"\n"
> +"Args:\n"
> +"  timeout:\n"
> +"    Wait time limit stored represented as a datetime.timedelta object.\n"
> +"\n"

As discussed in earlier mails, consider accepting int nanoseconds and/or
float secs as well.  Forcing the user to build a timedelta is a PITA.
Same applies for all time periods.

[snip]
> +PyDoc_STRVAR(chip_get_line_offset_from_name_doc,
> +"Map a line's name to its offset within the chip.\n"
> +"\n"
> +"Args:\n"
> +"  name:\n"
> +"    Name of the GPIO line to map.\n"
> +"\n"
> +"Returns:\n"
> +"  Line offset corresponding with the name or None if a line with given name\n"
> +"  is not exposed by this chip.");
> +

It should throw if the name search fails.

If name is already an int then just return the int.
(to allow the method to be used as a mapping function on a mixed
list.)  Though ironically the name isn't the best then.
Perhaps just get_line_offset() or map_line_offset()?

[snip]

> +static PyGetSetDef edge_event_getset[] = {
> +	{
> +		.name = "type",
> +		.get = (getter)edge_event_get_type,
> +		.doc = edge_event_get_type_doc,
> +	},
> +	{
> +		.name = "timestamp_ns",
> +		.get = (getter)edge_event_timestamp_ns,
> +		.doc = edge_event_timestamp_ns_doc,
> +	},
> +	{
> +		.name = "line_offset",
> +		.get = (getter)edge_event_line_offset,
> +		.doc = edge_event_line_offset_doc,
> +	},
> +	{
> +		.name = "global_seqno",
> +		.get = (getter)edge_event_global_seqno,
> +		.doc = edge_event_global_seqno_doc,
> +	},
> +	{
> +		.name = "line_seqno",
> +		.get = (getter)edge_event_line_seqno,
> +		.doc = edge_event_line_seqno_doc,
> +	},
> +	{ }
> +};
> +

Provide a helper to convert the timestamp_ns into a time.datetime.
(for event_clock_realtime)

[snip]
> +static const struct exception_desc exceptions[] = {
> +	{
> +		.name = "ChipClosedError",
> +		.base = "Exception",
> +		.doc = "Error raised when an already closed chip is used.",
> +	},
> +	{
> +		.name = "RequestReleasedError",
> +		.base = "Exception",
> +		.doc = "Error raised when a released request is used.",
> +	},
> +	{
> +		.name = "BadMappingError",
> +		.base = "Exception",
> +		.doc = "Exception thrown when the core C library returns an invalid value for any of the line properties.",
> +	},

Name is too vague - a bad mapping could mean anything - including its own
name ;-).
How about "UnknownPropertyValueError"?  "unknown" rather than "invalid"
as the likely cause is an updated C library.
Or even just a ValueError might work.

[snip]
> +
> +static PyGetSetDef info_event_getset[] = {
> +	{
> +		.name = "type",
> +		.get = (getter)info_event_get_type,
> +		.doc = info_event_get_type_doc,
> +	},
> +	{
> +		.name = "timestamp_ns",
> +		.get = (getter)info_event_timestamp_ns,
> +		.doc = info_event_timestamp_ns_doc,
> +	},
> +	{
> +		.name = "line_info",
> +		.get = (getter)info_event_line_info,
> +		.doc = info_event_line_info_doc,
> +	},
> +	{ }
> +};
> +

Provide a helper to convert timestamp_ns to time.datetime.
This one is a bit trickier as the kernel only ever provides monotonic
clock, so need to perform the monotonic -> realtime conversion.
(for reference my proposed gpiowatch tool does this)

[snip]
> +PyDoc_STRVAR(line_config_set_props_default_doc,
> +"Set the defaults for properties.\n"
> +"\n"
> +"Args:\n"
> +"  direction:\n"
> +"    Default direction.\n"
> +"  edge_detection:\n"
> +"    Default edge detection.\n"
> +"  bias:\n"
> +"    Default bias.\n"
> +"  drive:\n"
> +"    Default drive.\n"
> +"  active_low:\n"
> +"    Default active-low setting.\n"
> +"  debounce_period:\n"
> +"    Default debounce period.\n"
> +"  event_clock:\n"
> +"    Default event clock.\n"
> +"  output_value:\n"
> +"    Default output value.");
> +

How about merging the _default and _offset forms by adding an offsets
kwarg?
offsets=None (or unspecified) -> default
offsets=int -> offset
offsets=iterable -> offsets

Off on a bit of a tangent... why should the end user care about
defaults and overrides?
For a higher level abstraction I'd prefer to see the whole "default"
concept disappear in favour of the config for each line.  That would
remove a lot of the complexity from the LineConfig interface.
Though it would add complexity to the binding internals.

[snip]
> +PyDoc_STRVAR(line_config_get_props_default_doc,
> +"Get default values for a set of line properties.\n"
> +"\n"
> +"Args:\n"
> +"  properties:\n"
> +"    List of properties (gpiod.LineConfig.Property) for which to get default\n"
> +"    values.\n"
> +"\n"
> +"Returns:\n"
> +"  List of default values for properties specified in the argument list and\n"
> +"  in the same order");
> +

As per the set, consider merging the _default and _offset forms by
adding an offset kwarg.

[snip]

> +PyDoc_STRVAR(line_info_type_doc,
> +"Line info object contains an immutable snapshot of a line's status.");
> +

Either "LineInfo" or "Immutable object containing..." as you use
elsewhere (I'd go with the latter for consistency).

[snip]

> +	} else {
> +		for (i = 0; i < num_values; i++) {
> +			offset = PyList_GetItem(offsets_obj, i);
> +			if (!offset) {
> +				PyMem_Free(values);
> +				PyMem_Free(offsets);
> +				return NULL;
> +			}
> +
> +			offsets[i] = Py_gpiod_PyLongAsUnsignedInt(offset);
> +			if (PyErr_Occurred()){
                                 ^ missing whitespace.

> +				PyMem_Free(values);
> +				PyMem_Free(offsets);
> +				return NULL;
> +			}
> +		}
> +	}
> +
> +	Py_BEGIN_ALLOW_THREADS;
> +	ret = gpiod_line_request_get_values_subset(self->request, num_values,
> +						   offsets, values);

[snip]

> +static const PyCEnum_EnumDef line_enums[] = {
> +	{
> +		.name = "Value",
> +		.values = value_enum_vals
> +	},
> +	{
> +		.name = "Direction",
> +		.values = direction_enum_vals
> +	},
> +	{
> +		.name = "Bias",
> +		.values = bias_enum_vals
> +	},
> +	{
> +		.name = "Drive",
> +		.values = drive_enum_vals
> +	},
> +	{
> +		.name = "Edge",
> +		.values = edge_enum_vals
> +	},
> +	{
> +		.name = "Clock",
> +		.values = event_clock_enum_vals
> +	},
> +	{ }
> +};
> +

Clock -> EventClock here and elsewhere

[snip]

> +static PyObject *
> +make_line_cfg_kwargs(PyObject *direction, PyObject *edge_detection,
> +		     PyObject *bias, PyObject *drive, PyObject *active_low,
> +		     PyObject *debounce_period, PyObject *event_clock,
> +		     PyObject *output_value, PyObject *output_values)
> +{
> +	static const char *const keys[] = {
> +		"direction",
> +		"edge_detection",
> +		"bias",
> +		"drive",
> +		"active_low",
> +		"debounce_period",
> +		"event_clock",
> +		"output_value",
> +		"output_values",
> +	};
> +
> +	PyObject *kwargs, *vals[9];
> +	int ret, i;
> +
> +	vals[0] = direction;
> +	vals[1] = edge_detection;
> +	vals[2] = bias;
> +	vals[3] = drive;
> +	vals[4] = active_low;
> +	vals[5] = debounce_period;
> +	vals[6] = event_clock;
> +	vals[7] = output_value;
> +	vals[8] = output_values;
> +
> +	if (memcmp(vals, "\0\0\0\0\0\0\0\0\0", 9) == 0)
> +		return NULL;
> +
> +	kwargs = PyDict_New();
> +	if (!kwargs)
> +		return NULL;
> +
> +	for (i = 0; i < 9; i ++) {
                        ^ extra whitespace

> +		if (!vals[i])
> +			continue;
> +
> +		ret = PyDict_SetItemString(kwargs, keys[i], vals[i]);
> +		if (ret) {
> +			Py_DECREF(kwargs);
> +			return NULL;
> +		}
> +	}
> +
> +	return kwargs;
> +}
> +

[snip]

> +	res = PyObject_Call(method, args, line_cfg_kwargs);
> +	Py_DECREF(args);
> +	Py_DECREF(method);
> +	if (!Py_IsNone(res)) {
> +		Py_DECREF(res);
> +		return NULL;
> +	}
> +

As mentioned in a separate mail, Py_IsNone() requires Python 3.10, while
the configure.ac allows 3.9.

> +	Py_DECREF(res);
> +
> +	return line_cfg;
> +}
> +
> +static PyObject *
> +module_request_lines(PyObject *self, PyObject *args, PyObject *kwargs)
> +{
> +	static char *kwlist[] = {
> +		"path",
> +		"req_cfg",
> +		"line_cfg",
> +		"lines",
> +		"direction",
> +		"edge_detection",
> +		"bias",
> +		"drive",
> +		"active_low",
> +		"debounce_period",
> +		"event_clock",
> +		"output_value",
> +		"output_values",
> +		NULL
> +	};
> +

My suggestion to provide a lines parameter here was actually a poor one,
given the LineConfig only deals with offsets - which is totally reasonable
as supporting line names in LineConfig would be complicated.
I would prefer the two to be consistent, and so use offsets.

If get_line_offset_from_name() was better for mapping (in the Python
sense) then you could just use a list comprehension to convert a list of
names/offsets into a list of offsets to pass in here.

So I would change lines to offsets here and make
get_line_offset_from_name() more useful for mapping (more on that where
it is defined).

> +	PyObject *path, *req_cfg = NULL, *line_cfg = NULL, *lines = NULL,
> +		 *direction = NULL, *edge_detection = NULL, *bias = NULL,
> +		 *drive = NULL, *active_low = NULL, *debounce_period = NULL,
> +		 *event_clock = NULL, *output_value = NULL,
> +		 *output_values = NULL, *dict, *chip, *req, *line_cfg_kwargs;
> +	int ret;
> +
> +	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "O|OO$OOOOOOOOOO",
> +					  kwlist, &path, &req_cfg, &line_cfg,
> +					  &lines, &direction, &edge_detection,
> +					  &bias, &drive, &active_low,
> +					  &debounce_period, &event_clock,
> +					  &output_value, &output_values);
> +	if (!ret)
> +		return NULL;
> +
> +	dict = PyModule_GetDict(self);
> +	if (!dict)
> +		return NULL;
> +
> +	chip = make_chip(dict, path);
> +	if (!chip)
> +		return NULL;
> +
> +	req_cfg = make_req_cfg(dict, chip, req_cfg, lines);
> +	if (!req_cfg) {
> +		close_chip(chip);
> +		return NULL;
> +	}
> +

What if lines is None or empty?

A failed name -> offset mapping in make_req_cfg() and set_lines() results
in a returned NULL here?  Shouldn't it provide a meaningful error or throw
an exception?
Change to passing in offsets and this problem goes away.

[snip]

> --- a/configure.ac
> +++ b/configure.ac
> @@ -198,7 +198,7 @@ AM_CONDITIONAL([WITH_BINDINGS_PYTHON], [test "x$with_bindings_python" = xtrue])
>  
>  if test "x$with_bindings_python" = xtrue
>  then
> -	AM_PATH_PYTHON([3.0], [],
> +	AM_PATH_PYTHON([3.9], [],

Given this requirement, make sure it compiles with Python 3.9.

>  		[AC_MSG_ERROR([python3 not found - needed for python bindings])])
>  	AC_CHECK_PROG([has_python_config], [python3-config], [true], [false])
>  	if test "x$has_python_config" = xfalse
> @@ -243,6 +243,7 @@ AC_CONFIG_FILES([Makefile
>  		 bindings/cxx/examples/Makefile
>  		 bindings/cxx/tests/Makefile
>  		 bindings/python/Makefile
> +		 bindings/python/enum/Makefile
>  		 bindings/python/examples/Makefile
>  		 bindings/python/tests/Makefile
>  		 man/Makefile])
> -- 
> 2.34.1
> 

Nothing major really.
I would personally like to have a slightly higher level of abstraction,
but given you are going for a minimalist wrapper around libgpiod, it
seems totally reasonable.

Cheers,
Kent.
