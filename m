Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9756D5F7A80
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Oct 2022 17:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiJGP0U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Oct 2022 11:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiJGP0T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2022 11:26:19 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1D2BE2F3
        for <linux-gpio@vger.kernel.org>; Fri,  7 Oct 2022 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665156378; x=1696692378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w5GCTlnL3rg8ZJreSoASacw5JDEfpiEgulIzAJXTbHM=;
  b=U8NjCPeCa9+K1+KhHM7bzreT0jFx5aEuH0sFWoLYGRV+GfAmWNC5roTO
   8pOd8EmcYptjhgvj0TirJo49HIDGPbBtB0YALDvPfqgPxpx868wBx/yTi
   pP9FhOj11W3RHew316ZikAhUk3T5DW++bGZ1tYKhihkPs9O7He9k8rgao
   QbxFmd3jbXXnchkegCWyXxvy989CNiQqCgGfokaO0lMLpq8PRCUpTvUqr
   NP6ZasaoMZjil6g7+4uuA45432m/TEWoyzO/88MpdLx2erahbQMY/s+8E
   jg+UfNDbVGFUGJ8e1rk9aABD69yvVDocq0hK1V8AcYnLIHNT8srfv6yHH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="367885313"
X-IronPort-AV: E=Sophos;i="5.95,167,1661842800"; 
   d="scan'208";a="367885313"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2022 08:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="767611632"
X-IronPort-AV: E=Sophos;i="5.95,167,1661842800"; 
   d="scan'208";a="767611632"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2022 08:26:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ogpEs-003eiV-2T;
        Fri, 07 Oct 2022 18:26:14 +0300
Date:   Fri, 7 Oct 2022 18:26:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 4/4] bindings: python: implement python
 bindings for libgpiod v2
Message-ID: <Y0BFFpGvs1NqDzjE@smile.fi.intel.com>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007145521.329614-5-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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

...

> +	line_settings.py 

Trailing white space.

...

> +__version__ = _ext.__version__
> +
> +

Single blank line is enough, no?
Same seems applicable to other files.

...

> +def request_lines(path: str, *args, **kwargs) -> LineRequest:
> +    """
> +    Open a GPIO chip pointed to by 'path', request lines according to the
> +    configuration arguments, close the chip and return the request object.

This description seems wrong. First we collect the request object, then close
the chip, right?

> +    Args:
> +      path
> +        Path to the GPIO character device file.
> +      *args
> +      **kwargs
> +        See Chip.request_lines() for configuration arguments.
> +
> +    Returns:
> +      Returns a new LineRequest object.
> +    """
> +    with Chip(path) as chip:
> +        return chip.request_lines(*args, **kwargs)

...

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

Oh, this does not sound pythonic, does it? I would expect that this will be closed
automatically on object destruction.

Or user may call it explicitly by

	del chip

Of course .close() method may be good to have.

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

I don't understand this dance in the most of the methods. Why do we need to
check this?

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
> +        """
> +        self._check_closed()

> +        if not isinstance(id, int):

Why not use positive conditional here and everywhere in the similar cases?

	if isinstance():
		...
	else
		...

> +            try:
> +                return self._chip.map_line(id)
> +            except OSError as ex:
> +                if ex.errno == ENOENT:

> +                    try:
> +                        offset = int(id)
> +                    except ValueError:
> +                        raise ex

How this can be non-exceptional? I don't see how id can change its type from
non-int (which is checked above by isinstance() call) to int?

> +                else:
> +                    raise ex

Last time I have interaction with Python and developers who write the code
in Python the custom exception class was good thing to have. Is this changed
during the times?

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

> +    def wait_info_event(
> +        self, timeout: Optional[Union[timedelta, float]] = None
> +    ) -> bool:

pylint (btw, do you use it?) has a limit of 100 for a long time. The above can
be places on one line.

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

> +            if isinstance(lines, int) or isinstance(lines, str):
> +                lines = (lines,)

Instead of putting str and int objects into one bucket, handling exceptions,
etc, I would rather see two methods (one per type).

> +            for line in lines:
> +                offset = self.map_line(line)
> +                offsets.append(offset)
> +                if isinstance(line, str):
> +                    name_map[line] = offset
> +                    offset_map[offset] = line
> +
> +            if settings is None:
> +                settings = LineSettings()
> +
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

-- 
With Best Regards,
Andy Shevchenko


