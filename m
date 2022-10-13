Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623D65FD377
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 05:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiJMDKj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 23:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJMDKh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 23:10:37 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A6D537D7
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 20:10:32 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so790097pjl.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 20:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YxQ5xKQJdnFbGxVRSkc5Xp+lEy1Uzx29C6N5jqU4EQ8=;
        b=bWU6SPxOT/aGrKb/ZLuBTZfy97D96eAT9Rn6qxpSWE+wam9RlFLWxTyAY0+T1BLM3d
         HWeguudrZxJUoH2vDAQ29oLA/kH+SC8/eiHnP36tt/4xghKmiifZkjyFIMTwMyAKuihP
         QkTaT4O/ye3YUwWDrqMxoFNu6a0DiV4kHM4n4XmNwmE754fIUcAwdV+V4PApmfq9yjxw
         uRpkfq/vGYXA38WG32fW018TeIfxKCWJrbJhjwnfVcZnoVUAqGx9XM8g0tpKQ8Lzm+0f
         O2HmrUBlsTlCWZzABsoIQYhXdr9Hl/YwCwT9sKfLfhT23k+yC3YQO7KO3PUWhCFP5Cob
         2tCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxQ5xKQJdnFbGxVRSkc5Xp+lEy1Uzx29C6N5jqU4EQ8=;
        b=j4J92VZG4atkzCk1T3UAlkhLg5G61Tg4qfiM+bhVOAF+CVWoGCZ5B0uKxRMhXGA9y5
         2R4r8MrMwhl7yqddtE62M9FOP4IVVvV7Mp4POtl+8454LCSapnwNp1MhvHIwxc4ei2t2
         p9l+4ethLfQlANyNJsHlz/nLukBxLHnuFU877/oZHhAC/+fPYLD+Ng5y/Cgd5oK4h3Yx
         Y/oXeCK+M40SZE/NuLSc8GbqWVjjZNRg51LfuvRIhOl57geL1/AJ7yJLCd/jD6Jdl4AA
         5+ociV0diYUilXZnpp/Mp6IEgUvKtoXDCiZw/UBKUSrnTm8egS2QjZSHy9LLHshMY9fZ
         0i4A==
X-Gm-Message-State: ACrzQf1SlzdEhsjhjqNLv8tCLBKu2j+nhh2vHwJsgZyVbdXRR0MCPpHy
        5vQT4Rh+Kxy0hIih77gs3n8=
X-Google-Smtp-Source: AMsMyM4QECA7l3/cgRaqcxnScnwZeoTyMmRykC1Zxy/E7b+rqvp9pFPS6AR31M3SfQDMT8aQN+z+4g==
X-Received: by 2002:a17:903:22cc:b0:178:18a1:d16c with SMTP id y12-20020a17090322cc00b0017818a1d16cmr33233189plg.155.1665630631545;
        Wed, 12 Oct 2022 20:10:31 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709026e0900b00176ca533ea0sm4164997plk.90.2022.10.12.20.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 20:10:31 -0700 (PDT)
Date:   Thu, 13 Oct 2022 11:10:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 4/4] bindings: python: implement python
 bindings for libgpiod v2
Message-ID: <Y0eBonEvVclIBQS8@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221007145521.329614-5-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 07, 2022 at 04:55:21PM +0200, Bartosz Golaszewski wrote:
> This adds python bindings for libgpiod v2. As opposed to v1, they are
> mostly written in python with just low-level elements written in C and
> interfacing with libgpiod.so.
> 
> We've also added setup.py which will allow to use pip for managing the
> bindings and split them into a separate meta-openembedded recipe.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

<snipping out files with no probs>

> +++ b/bindings/python/gpiod/Makefile.am
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +SUBDIRS = ext
> +
> +EXTRA_DIST = \
> +	chip_info.py \
> +	chip.py \
> +	edge_event.py \
> +	exception.py \
> +	info_event.py \
> +	__init__.py \
> +	internal.py \
> +	line_info.py \
> +	line.py \
> +	line_request.py \
> +	line_settings.py 
                    ^
trailing whitespace

> +++ b/bindings/python/gpiod/chip.py
> @@ -0,0 +1,308 @@
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +from . import _ext
> +from .chip_info import ChipInfo
> +from .exception import ChipClosedError
> +from .info_event import InfoEvent
> +from .internal import poll_fd
> +from .line_info import LineInfo
> +from .line_settings import LineSettings, _line_settings_to_ext_line_settings
> +from .line_request import LineRequest
> +from datetime import timedelta
> +from errno import ENOENT
> +from select import select
> +from typing import Union, Optional
> +
> +
> +class Chip:
> +    """
> +    Represents a GPIO chip.
> +
> +    Chip object manages all resources associated with the GPIO chip it represents.
> +
> +    The gpiochip device file is opened during the object's construction. The Chip
> +    object's constructor takes the path to the GPIO chip device file
> +    as the only argument.
> +
> +    Callers must close the chip by calling the close() method when it's no longer
> +    used.
> +
> +    Example:
> +
> +        chip = gpiod.Chip(\"/dev/gpiochip0\")
> +        do_something(chip)
> +        chip.close()
> +
> +    The gpiod.Chip class also supports controlled execution ('with' statement).
> +
> +    Example:
> +
> +        with gpiod.Chip(path="/dev/gpiochip0") as chip:
> +            do_something(chip)
> +    """
> +
> +    def __init__(self, path: str):
> +        """
> +        Open a GPIO device.
> +
> +        Args:
> +          path:
> +            Path to the GPIO character device file.
> +        """
> +        self._chip = _ext.Chip(path)
> +
> +    def __bool__(self) -> bool:
> +        """
> +        Boolean conversion for GPIO chips.
> +
> +        Returns:
> +          True if the chip is open and False if it's closed.
> +        """
> +        return True if self._chip else False
> +
> +    def __enter__(self):
> +        """
> +        Controlled execution enter callback.
> +        """
> +        self._check_closed()
> +        return self
> +
> +    def __exit__(self, exc_type, exc_value, traceback) -> None:
> +        """
> +        Controlled execution exit callback.
> +        """
> +        self.close()
> +
> +    def _check_closed(self) -> None:
> +        if not self._chip:
> +            raise ChipClosedError()
> +
> +    def close(self) -> None:
> +        """
> +        Close the associated GPIO chip descriptor. The chip object must no
> +        longer be used after this method is called.
> +        """
> +        self._check_closed()
> +        self._chip.close()
> +        self._chip = None
> +
> +    def get_info(self) -> ChipInfo:
> +        """
> +        Get the information about the chip.
> +
> +        Returns:
> +          New gpiod.ChipInfo object.
> +        """
> +        self._check_closed()
> +        return self._chip.get_info()

Could the info be cached, rather than going to the kernel every time?
It's not as though it changes, and this gets used a lot by map_line()
below for range checking.

> +
> +    def map_line(self, id: Union[str, int]) -> int:
> +        """
> +        Map a line's identifier to its offset within the chip.
> +
> +        Args:
> +          id:
> +            Name of the GPIO line, its offset as a string or its offset as an
> +            integer.
> +
> +        Returns:
> +          If id is an integer - it's returned as is (unless it's out of range
> +          for this chip). If it's a string, the method tries to interpret it as
> +          the name of the line first and tries too perform a name lookup within
> +          the chip. If it fails, it tries to convert the string to an integer
> +          and check if it represents a valid offset within the chip and if
> +          so - returns it.

map_line() is a bit vague, like find_line().  How about offset_from_id()?

Should ids fallback to being interpreted as ints if they can't be
found as strings?  Why not leave that call to the user?
If they aren't sure they can try it as a string, and if that fails try
it as an int.
(I realise this is the reverse argument of my comment in the examples
patch btw - playing devil's advocate here - and there.)

Is the range check on ints necessary? The kernel will do that when you
make the call - what is the benefit of doing it here?
In which case why accept int at all?  Which would make the function
offset_from_name() - just like the C.

> +        """
> +        self._check_closed()
> +
> +        if not isinstance(id, int):
> +            try:
> +                return self._chip.map_line(id)
> +            except OSError as ex:
> +                if ex.errno == ENOENT:
> +                    try:
> +                        offset = int(id)
> +                    except ValueError:
> +                        raise ex
> +                else:
> +                    raise ex
> +        else:
> +            offset = id
> +
> +        if offset >= self.get_info().num_lines:
> +            raise ValueError("line offset of out range")
> +
> +        return offset
> +
> +    def _get_line_info(self, line: Union[int, str], watch: bool) -> LineInfo:
> +        self._check_closed()

Wrt the _check_closed(), what is to prevent another thread closing the
chip here, and causing the next line to segfault?

And self.map_line(line) can release the GIL so all bets are off even if
you assume cooperative multitasking - not that you can assume that.

> +        return self._chip.get_line_info(self.map_line(line), watch)
> +
> +    def get_line_info(self, line: Union[int, str]) -> LineInfo:
> +        """
> +        Get the snapshot of information about the line at given offset.
> +
> +        Args:
> +          line:
> +            Offset or name of the GPIO line to get information for.
> +
> +        Returns:
> +          New LineInfo object.
> +        """
> +        return self._get_line_info(line, watch=False)
> +
> +    def watch_line_info(self, line: Union[int, str]) -> LineInfo:
> +        """
> +        Get the snapshot of information about the line at given offset and
> +        start watching it for future changes.
> +
> +        Args:
> +          line:
> +            Offset or name of the GPIO line to get information for.
> +
> +        Returns:
> +          New gpiod.LineInfo object.
> +        """
> +        return self._get_line_info(line, watch=True)
> +
> +    def unwatch_line_info(self, line: Union[int, str]) -> None:
> +        """
> +        Stop watching a line for status changes.
> +
> +        Args:
> +          line:
> +            Offset or name of the line to stop watching.
> +        """
> +        self._check_closed()
> +        return self._chip.unwatch_line_info(self.map_line(line))
> +
> +    def wait_info_event(
> +        self, timeout: Optional[Union[timedelta, float]] = None
> +    ) -> bool:
> +        """
> +        Wait for line status change events on any of the watched lines on the
> +        chip.
> +
> +        Args:
> +          timeout:
> +            Wait time limit represented as either a datetime.timedelta object
> +            or the number of seconds stored in a float.
> +
> +        Returns:
> +          True if an info event is ready to be read from the chip, False if the
> +          wait timed out without any events.
> +        """
> +        self._check_closed()
> +
> +        return poll_fd(self.fd, timeout)
> +
> +    def read_info_event(self) -> InfoEvent:
> +        """
> +        Read a single line status change event from the chip.
> +
> +        Returns:
> +          New gpiod.InfoEvent object.
> +
> +        Note:
> +          This function may block if there are no available events in the queue.
> +        """
> +        self._check_closed()
> +        return self._chip.read_info_event()
> +
> +    def request_lines(
> +        self,
> +        config: dict[tuple[Union[int, str]], Optional[LineSettings]],
> +        consumer: Optional[str] = None,
> +        event_buffer_size: Optional[int] = None,
> +    ) -> LineRequest:
> +        """
> +        Request a set of lines for exclusive usage.
> +
> +        Args:
> +          config:
> +            Dictionary mapping offsets or names (or tuples thereof) to
> +            LineSettings. If None is passed as the value of the mapping,
> +            default settings are used.

What are the semantics for lines being repeated in the dict keys (which
is possible as the keys are tuples, and also because the line can be
identified by offset or name)?

> +          consumer:
> +            Consumer string to use for this request.
> +          event_buffer_size:
> +            Size of the kernel edge event buffer to configure for this request.
> +
> +        Returns:
> +          New LineRequest object.
> +        """
> +        self._check_closed()
> +
> +        line_cfg = _ext.LineConfig()
> +
> +        for lines, settings in config.items():
> +            offsets = list()
> +            name_map = dict()
> +            offset_map = dict()
> +
> +            if isinstance(lines, int) or isinstance(lines, str):
> +                lines = (lines,)
> +
> +            for line in lines:
> +                offset = self.map_line(line)
> +                offsets.append(offset)
> +                if isinstance(line, str):
> +                    name_map[line] = offset
> +                    offset_map[offset] = line

Use list comprehensions instead of the for loop?

> +
> +            if settings is None:
> +                settings = LineSettings()
> +
               settings = settings or LineSettings()

Would use that directly below if it would fit in the line.

Rename _line_settings_to_ext_line_settings to _line_settings_to_ext,
as the second line_settings is redundant?  Then it might fit.

> +            line_cfg.add_line_settings(
> +                offsets, _line_settings_to_ext_line_settings(settings)
> +            )
> +
> +        req_internal = self._chip.request_lines(line_cfg, consumer, event_buffer_size)
> +        request = LineRequest(req_internal)
> +
> +        request._offsets = req_internal.offsets
> +        request._name_map = name_map
> +        request._offset_map = offset_map
> +
> +        request._lines = list()
> +        for off in request.offsets:
> +            request._lines.append(offset_map[off] if off in offset_map else off)

Again, prefer to use list comprehensions to translate lists like this.

> +
> +        return request
> +
> +    def __repr__(self) -> str:
> +        """
> +        Return a string that can be used to re-create this chip object.
> +        """
> +        if not self._chip:
> +            return "<Chip CLOSED>"
> +
> +        return 'Chip("{}")'.format(self.path)
> +
> +    def __str__(self) -> str:
> +        """
> +        Return a user-friendly, human-readable description of this chip.
> +        """
> +        if not self._chip:
> +            return "<Chip CLOSED>"
> +
> +        return '<Chip path="{}" fd={} info={}>'.format(
> +            self.path, self.fd, self.get_info()
> +        )
> +
> +    @property
> +    def path(self) -> str:
> +        """
> +        Filesystem path used to open this chip.
> +        """
> +        self._check_closed()
> +        return self._chip.path
> +
> +    @property
> +    def fd(self) -> int:
> +        """
> +        File descriptor associated with this chip.
> +        """
> +        self._check_closed()
> +        return self._chip.fd
> diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
> new file mode 100644
> index 0000000..47d5455
> --- /dev/null
> +++ b/bindings/python/gpiod/ext/chip.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: LGPL-2.1-or-later
> +// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +#include "internal.h"
> +
> +typedef struct {
> +	PyObject_HEAD;
> +	struct gpiod_chip *chip;
> +} chip_object;
> +
> +static int
> +chip_init(chip_object *self, PyObject *args, PyObject *Py_UNUSED(ignored))
> +{
> +	char *path;
> +	int ret;
> +
> +	ret = PyArg_ParseTuple(args, "s", &path);
> +	if (!ret)
> +		return -1;
> +
> +	Py_BEGIN_ALLOW_THREADS;
> +	self->chip = gpiod_chip_open(path);
> +	Py_END_ALLOW_THREADS;

Is the assignment to self->chip while not holding the GIL (between the
BEGIN and END) safe?
To be sure, assign to a local then assign that to self->chip after the END.

Similarly other BEGIN/END blocks should only access locals.
And even then you probably need locks to prevent threads trampling each
other, but the locks need the GIL, IIUC.

So I suspect your chip._check_closed()s need to be more like
  with chip._lock()

Similarly the other object validity checks.

> +	if (!self->chip) {
> +		Py_gpiod_SetErrFromErrno();
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static void chip_finalize(chip_object *self)
> +{
> +	if (self->chip)
> +		PyObject_CallMethod((PyObject *)self, "close", "");
> +}
> +
> +static PyObject *chip_path(chip_object *self, void *Py_UNUSED(ignored))
> +{
> +	return PyUnicode_FromString(gpiod_chip_get_path(self->chip));
> +}
> +
> +static PyObject *chip_fd(chip_object *self, void *Py_UNUSED(ignored))
> +{
> +	return PyLong_FromLong(gpiod_chip_get_fd(self->chip));
> +}
> +
> +static PyGetSetDef chip_getset[] = {
> +	{
> +		.name = "path",
> +		.get = (getter)chip_path,
> +	},
> +	{
> +		.name = "fd",
> +		.get = (getter)chip_fd,
> +	},
> +	{ }
> +};
> +
> +static PyObject *chip_close(chip_object *self, PyObject *Py_UNUSED(ignored))
> +{
> +	Py_BEGIN_ALLOW_THREADS;
> +	gpiod_chip_close(self->chip);
> +	Py_END_ALLOW_THREADS;
> +	self->chip = NULL;
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyObject *chip_get_info(chip_object *self, PyObject *Py_UNUSED(ignored))
> +{
> +	struct gpiod_chip_info *info;
> +	PyObject *type, *ret;
> +
> +	type = Py_gpiod_GetGlobalType("ChipInfo");
> +	if (!type)
> +		return NULL;
> +
> +	info = gpiod_chip_get_info(self->chip);
> +	if (!info)
> +		return PyErr_SetFromErrno(PyExc_OSError);
> +
> +	 ret = PyObject_CallFunction(type, "ssI",
> +				     gpiod_chip_info_get_name(info),
> +				     gpiod_chip_info_get_label(info),
> +				     gpiod_chip_info_get_num_lines(info));
> +	 gpiod_chip_info_free(info);
> +	 return ret;
> +}
> +
> +static PyObject *make_line_info(struct gpiod_line_info *info)
> +{
> +	PyObject *type;
> +
> +	type = Py_gpiod_GetGlobalType("LineInfo");
> +	if (!type)
> +		return NULL;
> +
> +	return PyObject_CallFunction(type, "IsOsiOiiiiOi",
                                                   ^
                                       "IsOsiOiiiiOk"

debounce_period_us is an unsigned long, not int.

> +				gpiod_line_info_get_offset(info),
> +				gpiod_line_info_get_name(info),
> +				gpiod_line_info_is_used(info) ?
> +							Py_True : Py_False,
> +				gpiod_line_info_get_consumer(info),
> +				gpiod_line_info_get_direction(info),
> +				gpiod_line_info_is_active_low(info) ?
> +							Py_True : Py_False,
> +				gpiod_line_info_get_bias(info),
> +				gpiod_line_info_get_drive(info),
> +				gpiod_line_info_get_edge_detection(info),
> +				gpiod_line_info_get_event_clock(info),
> +				gpiod_line_info_is_debounced(info) ?
> +							Py_True : Py_False,
> +				gpiod_line_info_get_debounce_period_us(info));
> +}
> +
> +static PyObject *chip_get_line_info(chip_object *self, PyObject *args)
> +{
> +	struct gpiod_line_info *info;
> +	unsigned int offset;
> +	PyObject *info_obj;
> +	int ret, watch;
> +
> +	ret = PyArg_ParseTuple(args, "Ip", &offset, &watch);
> +	if (!ret)
> +		return NULL;
> +
> +	Py_BEGIN_ALLOW_THREADS;
> +	if (watch)
> +		info = gpiod_chip_watch_line_info(self->chip, offset);
> +	else
> +		info = gpiod_chip_get_line_info(self->chip, offset);
> +	Py_END_ALLOW_THREADS;
> +	if (!info)
> +		return Py_gpiod_SetErrFromErrno();
> +
> +	info_obj = make_line_info(info);
> +	gpiod_line_info_free(info);
> +	return info_obj;
> +}
> +
> +static PyObject *
> +chip_unwatch_line_info(chip_object *self, PyObject *args)
> +{
> +	unsigned int offset;
> +	int ret;
> +
> +	ret = PyArg_ParseTuple(args, "I", &offset);
> +	if (!ret)
> +		return NULL;
> +
> +	Py_BEGIN_ALLOW_THREADS;
> +	ret = gpiod_chip_unwatch_line_info(self->chip, offset);
> +	Py_END_ALLOW_THREADS;
> +	if (ret)
> +		return Py_gpiod_SetErrFromErrno();
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyObject *
> +chip_read_info_event(chip_object *self, PyObject *Py_UNUSED(ignored))
> +{
> +	PyObject *type, *info_obj, *event_obj;
> +	struct gpiod_info_event *event;
> +	struct gpiod_line_info *info;
> +
> +	type = Py_gpiod_GetGlobalType("InfoEvent");
> +	if (!type)
> +		return NULL;
> +
> +	Py_BEGIN_ALLOW_THREADS;
> +	event = gpiod_chip_read_info_event(self->chip);
> +	Py_END_ALLOW_THREADS;
> +	if (!event)
> +		return Py_gpiod_SetErrFromErrno();
> +
> +	info = gpiod_info_event_get_line_info(event);
> +
> +	info_obj = make_line_info(info);
> +	if (!info_obj) {
> +		gpiod_info_event_free(event);
> +		return NULL;
> +	}
> +
> +	event_obj = PyObject_CallFunction(type, "iKO",
> +				gpiod_info_event_get_event_type(event),
> +				gpiod_info_event_get_timestamp_ns(event),
> +				info_obj);
> +	Py_DECREF(info_obj);
> +	gpiod_info_event_free(event);
> +	return event_obj;
> +}
> +
> +static PyObject *chip_map_line(chip_object *self, PyObject *args)
> +{
> +	int ret, offset;
> +	char *name;
> +
> +	ret = PyArg_ParseTuple(args, "s", &name);
> +	if (!ret)
> +		return NULL;
> +
> +	Py_BEGIN_ALLOW_THREADS;
> +	offset = gpiod_chip_get_line_offset_from_name(self->chip, name);
> +	Py_END_ALLOW_THREADS;
> +	if (offset < 0)
> +		return Py_gpiod_SetErrFromErrno();
> +
> +	return PyLong_FromLong(offset);
> +}
> +
> +static struct gpiod_request_config *
> +make_request_config(PyObject *consumer_obj, PyObject *event_buffer_size_obj)
> +{
> +	struct gpiod_request_config *req_cfg;
> +	size_t event_buffer_size;
> +	const char *consumer;
> +
> +	req_cfg = gpiod_request_config_new();
> +	if (!req_cfg) {
> +		Py_gpiod_SetErrFromErrno();
> +		return NULL;
> +	}
> +
> +	if (consumer_obj != Py_None) {
> +		consumer = PyUnicode_AsUTF8(consumer_obj);
> +		if (!consumer) {
> +			gpiod_request_config_free(req_cfg);
> +			return NULL;
> +		}
> +
> +		gpiod_request_config_set_consumer(req_cfg, consumer);
> +	}
> +
> +	if (event_buffer_size_obj != Py_None) {
> +		event_buffer_size = PyLong_AsSize_t(event_buffer_size_obj);
> +		if (PyErr_Occurred()) {
> +			gpiod_request_config_free(req_cfg);
> +			return NULL;
> +		}
> +
> +		gpiod_request_config_set_event_buffer_size(req_cfg,
> +							   event_buffer_size);
> +	}
> +
> +	return req_cfg;
> +}
> +
> +static PyObject *chip_request_lines(chip_object *self, PyObject *args)
> +{
> +	PyObject *line_config, *consumer, *event_buffer_size, *req_obj;
> +	struct gpiod_request_config *req_cfg;
> +	struct gpiod_line_config *line_cfg;
> +	struct gpiod_line_request *request;
> +	int ret;
> +
> +	ret = PyArg_ParseTuple(args, "OOO",
> +			       &line_config, &consumer, &event_buffer_size);
> +	if (!ret)
> +		return NULL;
> +
> +	line_cfg = Py_gpiod_LineConfigGetData(line_config);
> +	if (!line_cfg)
> +		return NULL;
> +
> +	req_cfg = make_request_config(consumer, event_buffer_size);
> +	if (!req_cfg)
> +		return NULL;
> +
> +	Py_BEGIN_ALLOW_THREADS;
> +	request = gpiod_chip_request_lines(self->chip, req_cfg, line_cfg);
> +	Py_END_ALLOW_THREADS;
> +	gpiod_request_config_free(req_cfg);
> +	if (!request)
> +		return Py_gpiod_SetErrFromErrno();
> +
> +	req_obj = Py_gpiod_MakeRequestObject(request);
> +	if (!req_obj)
> +		gpiod_line_request_release(request);
> +
> +	return req_obj;
> +}
> +
> +static PyMethodDef chip_methods[] = {
> +	{
> +		.ml_name = "close",
> +		.ml_meth = (PyCFunction)chip_close,
> +		.ml_flags = METH_NOARGS,
> +	},
> +	{
> +		.ml_name = "get_info",
> +		.ml_meth = (PyCFunction)chip_get_info,
> +		.ml_flags = METH_NOARGS,
> +	},
> +	{
> +		.ml_name = "get_line_info",
> +		.ml_meth = (PyCFunction)chip_get_line_info,
> +		.ml_flags = METH_VARARGS,
> +	},
> +	{
> +		.ml_name = "unwatch_line_info",
> +		.ml_meth = (PyCFunction)chip_unwatch_line_info,
> +		.ml_flags = METH_VARARGS,
> +	},
> +	{
> +		.ml_name = "read_info_event",
> +		.ml_meth = (PyCFunction)chip_read_info_event,
> +		.ml_flags = METH_NOARGS,
> +	},
> +	{
> +		.ml_name = "map_line",
> +		.ml_meth = (PyCFunction)chip_map_line,
> +		.ml_flags = METH_VARARGS,
> +	},
> +	{
> +		.ml_name = "request_lines",
> +		.ml_meth = (PyCFunction)chip_request_lines,
> +		.ml_flags = METH_VARARGS,
> +	},
> +	{ }
> +};
> +
> +PyTypeObject chip_type = {
> +	PyVarObject_HEAD_INIT(NULL, 0)
> +	.tp_name = "gpiod._ext.Chip",
> +	.tp_basicsize = sizeof(chip_object),
> +	.tp_flags = Py_TPFLAGS_DEFAULT,
> +	.tp_new = PyType_GenericNew,
> +	.tp_init = (initproc)chip_init,
> +	.tp_finalize = (destructor)chip_finalize,
> +	.tp_dealloc = (destructor)Py_gpiod_dealloc,
> +	.tp_getset = chip_getset,
> +	.tp_methods = chip_methods,
> +};
> diff --git a/bindings/python/gpiod/ext/line-settings.c b/bindings/python/gpiod/ext/line-settings.c
> new file mode 100644
> index 0000000..bd2a66a
> --- /dev/null
> +++ b/bindings/python/gpiod/ext/line-settings.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: LGPL-2.1-or-later
> +// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +#include "internal.h"
> +
> +typedef struct {
> +	PyObject_HEAD;
> +	struct gpiod_line_settings *settings;
> +} line_settings_object;
> +
> +static int set_int_prop(struct gpiod_line_settings *settings, int val,
> +			int (*func)(struct gpiod_line_settings *, int))
> +{
> +	int ret;
> +
> +	ret = func(settings, val);
> +	if (ret) {
> +		Py_gpiod_SetErrFromErrno();
> +		return -1;
> +	}
> +

Since the ret value is never used, skip the ret and just test the func
return directly?

Similarly elsewhere.

> +	return 0;
> +}
> +
> +static int
> +line_settings_init(line_settings_object *self, PyObject *args, PyObject *kwargs)
> +{
> +	static char *kwlist[] = {
> +		"direction",
> +		"edge_detection",
> +		"bias",
> +		"drive",
> +		"active_low",
> +		"debounce_period",
> +		"event_clock",
> +		"output_value",
> +		NULL
> +	};
> +
> +	int direction, edge, bias, drive, active_low, event_clock, output_value,
> +	    ret;
> +	unsigned long debounce_period;
> +
> +	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "IIIIpdII", kwlist,
                                                          ^
                                                     IIIIpkII

d is a double, k is an unsigned long

> +			&direction, &edge, &bias, &drive, &active_low,
> +			&debounce_period, &event_clock, &output_value);
> +	if (!ret)
> +		return -1;
> +
> +	self->settings = gpiod_line_settings_new();
> +	if (!self->settings) {
> +		Py_gpiod_SetErrFromErrno();
> +		return -1;
> +	}
> +
> +	ret = set_int_prop(self->settings, direction,
> +			   gpiod_line_settings_set_direction);
> +	if (ret)
> +		return -1;
> +
> +	ret = set_int_prop(self->settings, edge,
> +			   gpiod_line_settings_set_edge_detection);
> +	if (ret)
> +		return -1;
> +
> +	ret = set_int_prop(self->settings, bias,
> +			   gpiod_line_settings_set_bias);
> +	if (ret)
> +		return -1;
> +
> +	ret = set_int_prop(self->settings, drive,
> +			   gpiod_line_settings_set_drive);
> +	if (ret)
> +		return -1;
> +
> +	gpiod_line_settings_set_active_low(self->settings, active_low);
> +	gpiod_line_settings_set_debounce_period_us(self->settings,
> +						   debounce_period);
> +
> +	ret = set_int_prop(self->settings, edge,
> +			   gpiod_line_settings_set_edge_detection);
> +	if (ret)
> +		return -1;
> +
> +	ret = set_int_prop(self->settings, output_value,
> +			   gpiod_line_settings_set_output_value);
> +	if (ret)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static void line_settings_finalize(line_settings_object *self)
> +{
> +	if (self->settings)
> +		gpiod_line_settings_free(self->settings);
> +}
> +
> +PyTypeObject line_settings_type = {
> +	PyVarObject_HEAD_INIT(NULL, 0)
> +	.tp_name = "gpiod._ext.LineSettings",
> +	.tp_basicsize = sizeof(line_settings_object),
> +	.tp_flags = Py_TPFLAGS_DEFAULT,
> +	.tp_new = PyType_GenericNew,
> +	.tp_init = (initproc)line_settings_init,
> +	.tp_finalize = (destructor)line_settings_finalize,
> +	.tp_dealloc = (destructor)Py_gpiod_dealloc,
> +};
> +
> +struct gpiod_line_settings *Py_gpiod_LineSettingsGetData(PyObject *obj)
> +{
> +	line_settings_object *settings;
> +	PyObject *type;
> +
> +	type = PyObject_Type(obj);
> +	if (!type)
> +		return NULL;
> +
> +	if ((PyTypeObject *)type != &line_settings_type) {
> +		PyErr_SetString(PyExc_TypeError,
> +				"not a gpiod._ext.LineSettings object");
> +		Py_DECREF(type);
> +		return NULL;
> +	}
> +	Py_DECREF(type);
> +
> +	settings = (line_settings_object *)obj;
> +
> +	return settings->settings;
> +}
> diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
> new file mode 100644
> index 0000000..36b5b48
> --- /dev/null
> +++ b/bindings/python/gpiod/ext/request.c
> @@ -0,0 +1,402 @@
> +// SPDX-License-Identifier: LGPL-2.1-or-later
> +// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +#include "internal.h"
> +
> +typedef struct {
> +	PyObject_HEAD;
> +	struct gpiod_line_request *request;
> +	unsigned int *offsets;
> +	int *values;
> +	size_t num_lines;
> +} request_object;
> +
> +static int request_init(PyObject *Py_UNUSED(ignored0),
> +			PyObject *Py_UNUSED(ignored1),
> +			PyObject *Py_UNUSED(ignored2))
> +{
> +	PyErr_SetString(PyExc_NotImplementedError,
> +			"_ext.LineRequest cannot be instantiated");
> +
> +	return -1;
> +}
> +
> +static void request_finalize(request_object *self)
> +{
> +	if (self->request)
> +		PyObject_CallMethod((PyObject *)self, "release", "");
> +
> +	if (self->offsets)
> +		PyMem_Free(self->offsets);
> +
> +	if (self->values)
> +		PyMem_Free(self->values);
> +}
> +
> +static PyObject *
> +request_num_lines(request_object *self, void *Py_UNUSED(ignored))
> +{
> +	return PyLong_FromUnsignedLong(
> +			gpiod_line_request_get_num_lines(self->request));
> +}
> +
> +static PyObject *request_offsets(request_object *self, void *Py_UNUSED(ignored))
> +{
> +	PyObject *lines, *line;
> +	unsigned int *offsets;
> +	size_t num_lines, i;
> +	int ret;
> +
> +	num_lines = gpiod_line_request_get_num_lines(self->request);
> +
> +	offsets = PyMem_Calloc(num_lines, sizeof(unsigned int));
> +	if (!offsets)
> +		return PyErr_NoMemory();
> +
> +	gpiod_line_request_get_offsets(self->request, offsets);
> +
> +	lines = PyList_New(num_lines);
> +	if (!lines) {
> +		PyMem_Free(offsets);
> +		return NULL;
> +	}
> +
> +	for (i = 0; i < num_lines; i++) {
> +		line = PyLong_FromUnsignedLong(offsets[i]);
> +		if (!lines) {
                 ^
Should be line.

> +			Py_DECREF(lines);
> +			PyMem_Free(offsets);
> +			return NULL;
> +		}
> +
> +		ret = PyList_SetItem(lines, i, line);
> +		if (ret) {
> +			Py_DECREF(line);
> +			Py_DECREF(lines);
> +			PyMem_Free(offsets);
> +			return NULL;
> +		}
> +	}
> +
> +	PyMem_Free(offsets);
> +	return lines;
> +}
> +
> +static PyObject *request_fd(request_object *self, void *Py_UNUSED(ignored))
> +{
> +	return PyLong_FromLong(gpiod_line_request_get_fd(self->request));
> +}
> +
> +static PyGetSetDef request_getset[] = {
> +	{
> +		.name = "num_lines",
> +		.get = (getter)request_num_lines,
> +	},
> +	{
> +		.name = "offsets",
> +		.get = (getter)request_offsets,
> +	},
> +	{
> +		.name = "fd",
> +		.get = (getter)request_fd,
> +	},
> +	{ }
> +};
> +
> +static PyObject *
> +request_release(request_object *self, PyObject *Py_UNUSED(ignored))
> +{
> +	Py_BEGIN_ALLOW_THREADS;
> +	gpiod_line_request_release(self->request);
> +	Py_END_ALLOW_THREADS;
> +	self->request = NULL;
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static void clear_buffers(request_object *self)
> +{
> +	memset(self->offsets, 0, self->num_lines * sizeof(unsigned int));
> +	memset(self->values, 0, self->num_lines * sizeof(int));
> +}
> +
> +static PyObject *request_get_values(request_object *self, PyObject *args)
> +{
> +	PyObject *offsets, *values, *val, *type, *iter, *next;
> +	Py_ssize_t num_offsets;
> +	unsigned int pos;
> +	int ret;
> +
> +	ret = PyArg_ParseTuple(args, "OO", &offsets, &values);
> +	if (!ret)
> +		return NULL;
> +
> +	num_offsets = PyObject_Size(offsets);
> +	if (num_offsets < 0)
> +		return NULL;
> +
> +	type = Py_gpiod_GetGlobalType("Value");
> +	if (!type)
> +		return NULL;
> +
> +	iter = PyObject_GetIter(offsets);
> +	if (!iter)
> +		return NULL;
> +
> +	clear_buffers(self);
> +
> +	for (pos = 0;; pos++) {
> +		next = PyIter_Next(iter);
> +		if (!next) {
> +			Py_DECREF(iter);
> +			break;
> +		}
> +
> +		self->offsets[pos] = Py_gpiod_PyLongAsUnsignedInt(next);
> +		Py_DECREF(next);
> +		if (PyErr_Occurred()) {
> +			Py_DECREF(iter);
> +			return NULL;
> +		}
> +	}
> +
> +	Py_BEGIN_ALLOW_THREADS;
> +	ret = gpiod_line_request_get_values_subset(self->request,
> +						   self->num_lines,
> +						   self->offsets,
> +						   self->values);
> +	Py_END_ALLOW_THREADS;
> +	if (ret)
> +		return Py_gpiod_SetErrFromErrno();
> +
> +	for (pos = 0; pos < num_offsets; pos++) {

gpiod/ext/request.c:172:20: warning: comparison of integer expressions of different signedness: ‘unsigned int’ and ‘Py_ssize_t’ {aka ‘int’} [-Wsign-compare]
  172 |  for (pos = 0; pos < num_offsets; pos++) {
      |                    ^

> +		val = PyObject_CallFunction(type, "i", self->values[pos]);
> +		if (!val)
> +			return NULL;
> +
> +		ret = PyList_SetItem(values, pos, val);
> +		if (ret) {
> +			Py_DECREF(val);
> +			return NULL;
> +		}
> +	}
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyObject *request_set_values(request_object *self, PyObject *args)
> +{
> +	PyObject *values, *key, *val, *val_stripped;
> +	Py_ssize_t pos = 0;
> +	int ret;
> +
> +	ret = PyArg_ParseTuple(args, "O", &values);
> +	if (!ret)
> +		return NULL;
> +
> +	clear_buffers(self);
> +
> +	while (PyDict_Next(values, &pos, &key, &val)) {
> +		self->offsets[pos] = Py_gpiod_PyLongAsUnsignedInt(key);
> +		if (PyErr_Occurred())
> +			return NULL;
> +
> +		val_stripped = PyObject_GetAttrString(val, "value");
> +		if (!val_stripped)
> +			return NULL;
> +
> +		self->values[pos] = PyLong_AsLong(val_stripped);
> +		Py_DECREF(val_stripped);
> +		if (PyErr_Occurred())
> +			return NULL;
> +	}
> +
> +	Py_BEGIN_ALLOW_THREADS;
> +	ret = gpiod_line_request_set_values_subset(self->request,
> +						   self->num_lines,
> +						   self->offsets,
> +						   self->values);
> +	Py_END_ALLOW_THREADS;
> +	if (ret)
> +		return Py_gpiod_SetErrFromErrno();
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyObject *request_reconfigure_lines(request_object *self, PyObject *args)
> +{
> +	struct gpiod_line_config *line_cfg;
> +	PyObject *line_cfg_obj;
> +	int ret;
> +
> +	ret = PyArg_ParseTuple(args, "O", &line_cfg_obj);
> +	if (!ret)
> +		return NULL;
> +
> +	line_cfg = Py_gpiod_LineConfigGetData(line_cfg_obj);
> +	if (!line_cfg)
> +		return NULL;
> +
> +	Py_BEGIN_ALLOW_THREADS;
> +	ret = gpiod_line_request_reconfigure_lines(self->request, line_cfg);
> +	Py_END_ALLOW_THREADS;
> +	if (ret)
> +		return Py_gpiod_SetErrFromErrno();
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyObject *request_read_edge_event(request_object *self, PyObject *args)
> +{
> +	PyObject *max_events_obj, *event_obj, *events, *type;
> +	struct gpiod_edge_event_buffer *buffer;
> +	size_t max_events, num_events, i;
> +	struct gpiod_edge_event *event;
> +	int ret;
> +
> +	ret = PyArg_ParseTuple(args, "O", &max_events_obj);
> +	if (!ret)
> +		return NULL;
> +
> +	if (max_events_obj != Py_None) {
> +		max_events = PyLong_AsSize_t(max_events_obj);
> +		if (PyErr_Occurred())
> +			return NULL;
> +	} else {
> +		max_events = 64;
> +	}
> +
> +	type = Py_gpiod_GetGlobalType("EdgeEvent");
> +	if (!type)
> +		return NULL;
> +
> +	buffer = gpiod_edge_event_buffer_new(max_events);
> +	if (!buffer)
> +		return Py_gpiod_SetErrFromErrno();
> +

A new buffer every time?
Maybe cache it in the request_object for next time?

> +	Py_BEGIN_ALLOW_THREADS;
> +	ret = gpiod_line_request_read_edge_event(self->request,
> +						 buffer, max_events);
> +	Py_END_ALLOW_THREADS;
> +	if (ret < 0) {
> +		gpiod_edge_event_buffer_free(buffer);
> +		return NULL;
> +	}
> +
> +	num_events = ret;
> +
> +	events = PyList_New(num_events);
> +	if (!events) {
> +		gpiod_edge_event_buffer_free(buffer);
> +		return NULL;
> +	}
> +
> +	for (i = 0; i < num_events; i++) {
> +		event = gpiod_edge_event_buffer_get_event(buffer, i);
> +		if (!event) {
> +			gpiod_edge_event_buffer_free(buffer);
> +			Py_DECREF(events);
> +			return NULL;
> +		}
> +
> +		event_obj = PyObject_CallFunction(type, "iKiii",
> +				gpiod_edge_event_get_event_type(event),
> +				gpiod_edge_event_get_timestamp_ns(event),
> +				gpiod_edge_event_get_line_offset(event),
> +				gpiod_edge_event_get_global_seqno(event),
> +				gpiod_edge_event_get_line_seqno(event));
> +		if (!event_obj) {
> +			gpiod_edge_event_buffer_free(buffer);
> +			Py_DECREF(events);
> +			return NULL;
> +		}
> +
> +		ret = PyList_SetItem(events, i, event_obj);
> +		if (ret) {
> +			gpiod_edge_event_buffer_free(buffer);
> +			Py_DECREF(event_obj);
> +			Py_DECREF(events);
> +			return NULL;
> +		}
> +	}
> +
> +	gpiod_edge_event_buffer_free(buffer);
> +
> +	return events;
> +}
> +
> +static PyMethodDef request_methods[] = {
> +	{
> +		.ml_name = "release",
> +		.ml_meth = (PyCFunction)request_release,
> +		.ml_flags = METH_NOARGS,
> +	},
> +	{
> +		.ml_name = "get_values",
> +		.ml_meth = (PyCFunction)request_get_values,
> +		.ml_flags = METH_VARARGS,
> +	},
> +	{
> +		.ml_name = "set_values",
> +		.ml_meth = (PyCFunction)request_set_values,
> +		.ml_flags = METH_VARARGS,
> +	},
> +	{
> +		.ml_name = "reconfigure_lines",
> +		.ml_meth = (PyCFunction)request_reconfigure_lines,
> +		.ml_flags = METH_VARARGS,
> +	},
> +	{
> +		.ml_name = "read_edge_event",
> +		.ml_meth = (PyCFunction)request_read_edge_event,
> +		.ml_flags = METH_VARARGS,
> +	},
> +	{ }
> +};
> +
> +PyTypeObject request_type = {
> +	PyVarObject_HEAD_INIT(NULL, 0)
> +	.tp_name = "gpiod._ext.Request",
> +	.tp_basicsize = sizeof(request_object),
> +	.tp_flags = Py_TPFLAGS_DEFAULT,
> +	.tp_new = PyType_GenericNew,
> +	.tp_init = (initproc)request_init,
> +	.tp_finalize = (destructor)request_finalize,
> +	.tp_dealloc = (destructor)Py_gpiod_dealloc,
> +	.tp_getset = request_getset,
> +	.tp_methods = request_methods,
> +};
> +
> +PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request *request)
> +{
> +	request_object *req_obj;
> +	unsigned int *offsets;
> +	size_t num_lines;
> +	int *values;
> +
> +	num_lines = gpiod_line_request_get_num_lines(request);
> +
> +	req_obj = PyObject_New(request_object, &request_type);
> +	if (!req_obj)
> +		return NULL;
> +
> +	offsets = PyMem_Calloc(num_lines, sizeof(unsigned int));
> +	if (!offsets) {
> +		Py_DECREF(req_obj);
> +		return NULL;
> +	}
> +
> +	values = PyMem_Calloc(num_lines, sizeof(int));
> +	if (!values) {
> +		PyMem_Free(offsets);
> +		Py_DECREF(req_obj);
> +		return NULL;
> +	}
> +
> +	req_obj->request = request;
> +	req_obj->offsets = offsets;
> +	req_obj->values = values;
> +	req_obj->num_lines = num_lines;
> +
> +	return (PyObject *)req_obj;
> +}
> diff --git a/bindings/python/gpiod/line_info.py b/bindings/python/gpiod/line_info.py
> new file mode 100644
> index 0000000..9a6c9bf
> --- /dev/null
> +++ b/bindings/python/gpiod/line_info.py
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +from . import _ext
> +from dataclasses import dataclass
> +from datetime import timedelta
> +from gpiod.line import Direction, Bias, Drive, Edge, Clock
> +
> +
> +@dataclass(frozen=True, init=False, repr=False)
> +class LineInfo:
> +    """
> +    Snapshot of a line's status.
> +    """
> +
> +    offset: int
> +    name: str
> +    used: bool
> +    consumer: str
> +    direction: Direction
> +    active_low: bool
> +    bias: Bias
> +    drive: Drive
> +    edge_detection: Edge
> +    event_clock: Clock
> +    debounced: bool

I've probably asked this before, but does debounced differ from
not debounce_period?

> +    debounce_period: timedelta
> +
> +    def __init__(
> +        self,
> +        offset: int,
> +        name: str,
> +        used: bool,
> +        consumer: str,
> +        direction: int,
> +        active_low: bool,
> +        bias: int,
> +        drive: int,
> +        edge_detection: int,
> +        event_clock: int,
> +        debounced: bool,
> +        debounce_period_us: int,
> +    ):
> +        object.__setattr__(self, "offset", offset)
> +        object.__setattr__(self, "name", name)
> +        object.__setattr__(self, "used", used)
> +        object.__setattr__(self, "consumer", consumer)
> +        object.__setattr__(self, "direction", Direction(direction))
> +        object.__setattr__(self, "active_low", active_low)
> +        object.__setattr__(self, "bias", Bias(bias))
> +        object.__setattr__(self, "drive", Drive(drive))
> +        object.__setattr__(self, "edge_detection", Edge(edge_detection))
> +        object.__setattr__(self, "event_clock", Clock(event_clock))
> +        object.__setattr__(self, "debounced", debounced)
> +        object.__setattr__(
> +            self, "debounce_period", timedelta(microseconds=debounce_period_us)
> +        )
> +
> +    def __str__(self):
> +        return '<LineInfo offset={} name="{}" used={} consumer="{}" direction={} active_low={} bias={} drive={} edge_detection={} event_clock={} debounced={} debounce_period={}>'.format(
> +            self.offset,
> +            self.name,
> +            self.used,
> +            self.consumer,
> +            self.direction,
> +            self.active_low,
> +            self.bias,
> +            self.drive,
> +            self.edge_detection,
> +            self.event_clock,
> +            self.debounced,
> +            self.debounce_period,
> +        )
> diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
> new file mode 100644
> index 0000000..a3ee392
> --- /dev/null
> +++ b/bindings/python/gpiod/line_request.py
> @@ -0,0 +1,258 @@
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +from . import _ext
> +from .edge_event import EdgeEvent
> +from .exception import RequestReleasedError
> +from .internal import poll_fd
> +from .line import Value
> +from .line_settings import LineSettings, _line_settings_to_ext_line_settings
> +from collections.abc import Iterable
> +from datetime import timedelta
> +from typing import Optional, Union
> +
> +
> +class LineRequest:
> +    """
> +    Stores the context of a set of requested GPIO lines.
> +    """
> +
> +    def __init__(self, req: _ext.Request):
> +        """
> +        DON'T USE
> +
> +        LineRequest objects can only be instantiated by a Chip parent. This is
> +        not part of stable API.
> +        """
> +        self._req = req
> +
> +    def __bool__(self) -> bool:
> +        """
> +        Boolean conversion for GPIO line requests.
> +
> +        Returns:
> +          True if the request is live and False if it's been released.
> +        """
> +        return True if self._req else False

           return self._req

> +
> +    def __enter__(self):
> +        """
> +        Controlled execution enter callback.
> +        """
> +        self._check_released()
> +        return self
> +
> +    def __exit__(self, exc_type, exc_value, traceback):
> +        """
> +        Controlled execution exit callback.
> +        """
> +        self.release()
> +
> +    def _check_released(self) -> None:
> +        if not self._req:
> +            raise RequestReleasedError()
> +
> +    def release(self) -> None:
> +        """
> +        Release this request and free all associated resources. The object must
> +        not be used after a call to this method.
> +        """
> +        self._check_released()
> +        self._req.release()
> +        self._req = None
> +
> +    def get_value(self, line: Union[int, str]) -> Value:
> +        """
> +        Get a single GPIO line value.
> +
> +        Args:
> +          line:
> +            Offset or name of the line to get value for.
> +
> +        Returns:
> +          Logical value of the line.
> +        """
> +        return self.get_values([line])[0]
> +
> +    def get_values(
> +        self, lines: Optional[Iterable[Union[int, str]]] = None
> +    ) -> list[Value]:
> +        """
> +        Get values of a set of GPIO lines.
> +
> +        Args:
> +          lines:
> +            List of names or offsets of GPIO lines to get values for. Can be
> +            None in which case all requested lines will be read.
> +
> +        Returns:
> +          List of logical line values.
> +        """
> +        self._check_released()
> +
> +        if lines is None:
> +            lines = self._lines

What if lines is empty?  Is that equivalent to None, or an error?
If the former...

           lines = lines or self._lines

either here or where used below (if that changed to a list comprehension)

> +
> +        offsets = [None] * len(lines)
> +
> +        for i, line in enumerate(lines):
> +            if isinstance(line, str):
> +                if line not in self._name_map:
> +                    raise ValueError("unknown line name: {}".format(line))
> +
> +                offsets[i] = self._name_map[line]
> +            else:
> +                offsets[i] = line
> +

I would do this with a list comprehension and a helper function to do
the id to offset mapping.  i.e.

           offsets = [ offset_from_id(id) for id in lines ]

> +        buf = [None] * len(lines)
> +
> +        self._req.get_values(offsets, buf)
> +        return buf
> +
> +    def set_value(self, line: Union[int, str], value: Value) -> None:
> +        """
> +        Set the value of a single GPIO line.
> +
> +        Args:
> +          line:
> +            Offset or name of the line to set.
> +          value:
> +            New value.
> +        """
> +        self.set_values({line: value})
> +
> +    def set_values(self, values: dict[Union[int, str], Value]) -> None:
> +        """
> +        Set the values of a subset of GPIO lines.
> +
> +        Args:
> +          values:
> +            Dictionary mapping line offsets or names to desired values.
> +        """
> +        self._check_released()
> +
> +        mapped = dict()
> +        for i, line in enumerate(values):
> +            if isinstance(line, str):
> +                if line not in self._name_map:
> +                    raise ValueError("unknown line name: {}".format(line))
> +
> +                mapped[self._name_map[line]] = values[line]
> +            else:
> +                mapped[line] = values[line]
> +
> +        self._req.set_values(mapped)
> +
> +    def reconfigure_lines(
> +        self, config: dict[tuple[Union[int, str]], LineSettings]
> +    ) -> None:
> +        """
> +        Reconfigure requested lines.
> +
> +        Args:
> +          config
> +            Dictionary mapping offsets or names (or tuples thereof) to
> +            LineSettings. If None is passed as the value of the mapping,
> +            default settings are used.
> +        """
> +        self._check_released()
> +
> +        line_cfg = _ext.LineConfig()
> +
> +        for lines, settings in config.items():
> +            if isinstance(lines, int) or isinstance(lines, str):
> +                lines = [lines]
> +
> +            offsets = [None] * len(lines)
> +
> +            for i, line in enumerate(lines):
> +                if isinstance(line, str):
> +                    if line not in self._name_map:
> +                        raise ValueError("unknown line name: {}".format(line))
> +
> +                    offsets[i] = self._name_map[line]
> +                else:
> +                    offsets[i] = line

And again...
               offsets = [ offset_from_id(id) for id in lines ]

> +
> +            line_cfg.add_line_settings(
> +                offsets, _line_settings_to_ext_line_settings(settings)
> +            )
> +
> +        self._req.reconfigure_lines(line_cfg)
> +
> +    def wait_edge_event(
> +        self, timeout: Optional[Union[timedelta, float]] = None
> +    ) -> bool:
> +        """
> +        Wait for edge events on any of the requested lines.
> +
> +        Args:
> +          timeout:
> +            Wait time limit expressed as either a datetime.timedelta object
> +            or the number of seconds stored in a float.
> +
> +        Returns:
> +          True if events are ready to be read. False on timeout.
> +        """
> +        self._check_released()
> +
> +        return poll_fd(self.fd, timeout)
> +
> +    def read_edge_event(self, max_events: Optional[int] = None) -> list[EdgeEvent]:
> +        """
> +        Read a number of edge events from a line request.
> +
> +        Args:
> +          max_events:
> +            Maximum number of events to read.
> +
> +        Returns:
> +          List of read EdgeEvent objects.
> +        """
> +        self._check_released()
> +
> +        return self._req.read_edge_event(max_events)
> +
> +    def __str__(self):
> +        """
> +        Return a user-friendly, human-readable description of this request.
> +        """
> +        if not self._req:
> +            return "<LineRequest RELEASED>"
> +
> +        return "<LineRequest num_lines={} offsets={} fd={}>".format(
> +            self.num_lines, self.offsets, self.fd
> +        )
> +
> +    @property
> +    def num_lines(self) -> int:
> +        """
> +        Number of requested lines.
> +        """
> +        self._check_released()
> +        return len(self._offsets)
> +
> +    @property
> +    def offsets(self) -> list[int]:
> +        """
> +        List of requested offsets. Lines requested by name are mapped to their
> +        offsets.
> +        """
> +        self._check_released()
> +        return self._offsets
> +
> +    @property
> +    def lines(self) -> list[Union[int, str]]:
> +        """
> +        List of requested lines. Lines requested by name are listed as such.
> +        """
> +        self._check_released()
> +        return self._lines
> +
> +    @property
> +    def fd(self) -> int:
> +        """
> +        File descriptor associated with this request.
> +        """
> +        self._check_released()
> +        return self._req.fd
> diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
> new file mode 100644
> index 0000000..1315b0c
> --- /dev/null
> +++ b/bindings/python/gpiod/line_settings.py
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +from . import _ext
> +from dataclasses import dataclass
> +from datetime import timedelta
> +from gpiod.line import Direction, Bias, Drive, Edge, Clock, Value
> +
> +
> +@dataclass(repr=False)
> +class LineSettings:
> +    """
> +    Stores a set of line properties.
> +    """
> +
> +    direction: Direction = Direction.AS_IS
> +    edge_detection: Edge = Edge.NONE
> +    bias: Bias = Bias.AS_IS
> +    drive: Drive = Drive.PUSH_PULL
> +    active_low: bool = False
> +    debounce_period: timedelta = timedelta()
> +    event_clock: Clock = Clock.MONOTONIC
> +    output_value: Value = Value.INACTIVE
> +
> +    # __repr__ generated by @dataclass uses repr for enum members resulting in
> +    # an unusable representation as those are of the form: <NAME: $value>
> +    def __repr__(self):
> +        return "LineSettings(direction={}, edge_detection={} bias={} drive={} active_low={} debounce_period={} event_clock={} output_value={})".format(
> +            str(self.direction),
> +            str(self.edge_detection),
> +            str(self.bias),
> +            str(self.drive),
> +            self.active_low,
> +            repr(self.debounce_period),
> +            str(self.event_clock),
> +            str(self.output_value),
> +        )
> +
> +    def __str__(self):
> +        return "<LineSettings direction={} edge_detection={} bias={} drive={} active_low={} debounce_period={} event_clock={} output_value={}>".format(
> +            self.direction,
> +            self.edge_detection,
> +            self.bias,
> +            self.drive,
> +            self.active_low,
> +            self.debounce_period,
> +            self.event_clock,
> +            self.output_value,
> +        )
> +
> +
> +def _line_settings_to_ext_line_settings(settings: LineSettings) -> _ext.LineSettings:
> +    return _ext.LineSettings(
> +        direction=settings.direction.value,
> +        edge_detection=settings.edge_detection.value,
> +        bias=settings.bias.value,
> +        drive=settings.drive.value,
> +        active_low=settings.active_low,
> +        debounce_period=int(settings.debounce_period.total_seconds() * 1000000),
> +        event_clock=settings.event_clock.value,
> +        output_value=settings.output_value.value,
> +    )

As mentioned earlier, rename to _line_settings_to_ext??

> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> new file mode 100644
> index 0000000..ec8f99d
> --- /dev/null

Ok, the API is much nicer than the previous versions, so that is all
good, given some clarification on the config semantics.

Other than the couple of PyArg_ParseTupleAndKeywords issues, 
the other few minor bugs, and my obvious preference for using list
comprehensions to build lists, the big sticking point for me is thread
safety.
I'm not convinced your current approach is thread safe, so convince me,
either by proving me wrong or providing another solution.
Hopefully I'm wrong.

Cheers,
Kent.
