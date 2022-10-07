Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5005F7D38
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Oct 2022 20:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiJGSUM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Oct 2022 14:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbiJGSUK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2022 14:20:10 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CAA52470
        for <linux-gpio@vger.kernel.org>; Fri,  7 Oct 2022 11:20:08 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id 3so5835354vsh.5
        for <linux-gpio@vger.kernel.org>; Fri, 07 Oct 2022 11:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bos9BoYpivCC9cP/6+fDkdBkatD/+AqpUHWF+rgezA4=;
        b=PNoTLcpwtcfjNV/6xD6W0+qTWF92OWc/eHJyJAIe730oIU83qs8T7RFLX46+0mzXCr
         OCYNZ5rWSUstjYl+0shL/v4+rm3Hp0+a9zUFZaSuP3Rodn2bdxZ0C72LksFsUvgasECq
         d4yVP4k1mpyikVVYOp7FP7qYfG5WDadSioIlu5gHFCD6Y159L3u1dBORtPbu7rce9b0l
         eUFVRPAdIxzDSoiSMQ53sMcnNH7kkJd1qGDOyaKjc5YglbygQ7FtiateZtZR4FIZF0QP
         2fNUGK2M6GTbyozfhX895s8ym83s0aqmHu8Cw5g3fiGG4TLPcjVF+l4rOkljPtnpvPYN
         mZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bos9BoYpivCC9cP/6+fDkdBkatD/+AqpUHWF+rgezA4=;
        b=a4iUxfRtHLA/f1HFOJZ2TdwTmAlxyOJa4lWwpQ6wvjw5C1Er2+Clkg5ywEFU7OPbPt
         D+TArIDvh3k2/J3/fNMCUj3sALtOFKwoXM38rC//phie0eo3XTYlxr1kBUu33J2UxStu
         jA5V6luEPmadqp9ZARx+DvjuiE6tjGeEDrS3J61F+jsCtDy/qPZwWe5jHl30gXumRkPe
         2MlN69MiHui5JHShxUfNVoWp9wmH5wrQr3QEok3BzHagMxrP/bUlrqn7vjKupYu8Zrum
         trtYgsjFez1Gx8gdPNbk7wlMP/DwQFYDKNzuf9Vg8k94rmWVgeg2QGOTWC1Z8GsC6Il8
         C5Aw==
X-Gm-Message-State: ACrzQf1mfp2H08WHZGzqrbGbIxgIR7xYygPfLJBPMqlqRlMYyqir2pL8
        c4oYrbyy8FCEX9Csli4THVTiit25co5T0tA0DkFfQQ==
X-Google-Smtp-Source: AMsMyM62jlBfbUzIxXp6oew8zigXbLLDKFi//9ig6YRFGqnNhliwhctnKtmz8GQiE/GE1+ZkpvMgawWECEc2nccRRkE=
X-Received: by 2002:a05:6102:5788:b0:3a6:764d:1382 with SMTP id
 dh8-20020a056102578800b003a6764d1382mr4068433vsb.13.1665166807376; Fri, 07
 Oct 2022 11:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221007145521.329614-1-brgl@bgdev.pl> <20221007145521.329614-5-brgl@bgdev.pl>
 <Y0BFFpGvs1NqDzjE@smile.fi.intel.com>
In-Reply-To: <Y0BFFpGvs1NqDzjE@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 7 Oct 2022 20:19:56 +0200
Message-ID: <CAMRc=MdgSnLNsH0iS2V+Xq0uQsuT8TRVu5i1gTU6GeWrbKtdrw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v3 4/4] bindings: python: implement python
 bindings for libgpiod v2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 7, 2022 at 5:26 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Oct 07, 2022 at 04:55:21PM +0200, Bartosz Golaszewski wrote:
> > This adds python bindings for libgpiod v2. As opposed to v1, they are
> > mostly written in python with just low-level elements written in C and
> > interfacing with libgpiod.so.
> >
> > We've also added setup.py which will allow to use pip for managing the
> > bindings and split them into a separate meta-openembedded recipe.
>
> ...
>
> > +     line_settings.py
>
> Trailing white space.
>
> ...
>
> > +__version__ = _ext.__version__
> > +
> > +
>
> Single blank line is enough, no?
> Same seems applicable to other files.
>

I use black (https://pypi.org/project/black/) for formatting and it
does this between classes and in some other cases. I like this
formatting and it seems it's in line with various PEPs.

> ...
>
> > +def request_lines(path: str, *args, **kwargs) -> LineRequest:
> > +    """
> > +    Open a GPIO chip pointed to by 'path', request lines according to the
> > +    configuration arguments, close the chip and return the request object.
>
> This description seems wrong. First we collect the request object, then close
> the chip, right?
>

Well, yeah, we return it after we close the chip. Not sure what you mean.

> > +    Args:
> > +      path
> > +        Path to the GPIO character device file.
> > +      *args
> > +      **kwargs
> > +        See Chip.request_lines() for configuration arguments.
> > +
> > +    Returns:
> > +      Returns a new LineRequest object.
> > +    """
> > +    with Chip(path) as chip:
> > +        return chip.request_lines(*args, **kwargs)
>
> ...
>
> > +class Chip:
> > +    """
> > +    Represents a GPIO chip.
> > +
> > +    Chip object manages all resources associated with the GPIO chip it represents.
> > +
> > +    The gpiochip device file is opened during the object's construction. The Chip
> > +    object's constructor takes the path to the GPIO chip device file
> > +    as the only argument.
> > +
> > +    Callers must close the chip by calling the close() method when it's no longer
> > +    used.
> > +
> > +    Example:
> > +
> > +        chip = gpiod.Chip(\"/dev/gpiochip0\")
> > +        do_something(chip)
> > +        chip.close()
> > +
> > +    The gpiod.Chip class also supports controlled execution ('with' statement).
>
> Oh, this does not sound pythonic, does it? I would expect that this will be closed
> automatically on object destruction.
>
> Or user may call it explicitly by
>
>         del chip
>
> Of course .close() method may be good to have.
>

Python is not like C++, it doesn't have RAII. There are no guarantees
from the language itself that an object will be destroyed the moment
the last reference is dropped. It's more lika java in that aspect.
It's true that cpython implementation works like this for most cases
but we must not rely on any given implementation. Controlled execution
is very much the pythonic way.

> > +    Example:
> > +
> > +        with gpiod.Chip(path="/dev/gpiochip0") as chip:
> > +            do_something(chip)
> > +    """
> > +
> > +    def __init__(self, path: str):
> > +        """
> > +        Open a GPIO device.
> > +
> > +        Args:
> > +          path:
> > +            Path to the GPIO character device file.
> > +        """
> > +        self._chip = _ext.Chip(path)
> > +
> > +    def __bool__(self) -> bool:
> > +        """
> > +        Boolean conversion for GPIO chips.
> > +
> > +        Returns:
> > +          True if the chip is open and False if it's closed.
> > +        """
> > +        return True if self._chip else False
> > +
> > +    def __enter__(self):
> > +        """
> > +        Controlled execution enter callback.
> > +        """
>
> > +        self._check_closed()
>
> I don't understand this dance in the most of the methods. Why do we need to
> check this?
>

Because we don't want to allow the user to use a closed chip? The
underlying C part doesn't check it so if we don't do it here, it will
segfault.

> > +        return self
> > +
> > +    def __exit__(self, exc_type, exc_value, traceback) -> None:
> > +        """
> > +        Controlled execution exit callback.
> > +        """
> > +        self.close()
> > +
> > +    def _check_closed(self) -> None:
> > +        if not self._chip:
> > +            raise ChipClosedError()
> > +
> > +    def close(self) -> None:
> > +        """
> > +        Close the associated GPIO chip descriptor. The chip object must no
> > +        longer be used after this method is called.
> > +        """
> > +        self._check_closed()
> > +        self._chip.close()
> > +        self._chip = None
> > +
> > +    def get_info(self) -> ChipInfo:
> > +        """
> > +        Get the information about the chip.
> > +
> > +        Returns:
> > +          New gpiod.ChipInfo object.
> > +        """
> > +        self._check_closed()
> > +        return self._chip.get_info()
> > +
> > +    def map_line(self, id: Union[str, int]) -> int:
> > +        """
> > +        Map a line's identifier to its offset within the chip.
> > +
> > +        Args:
> > +          id:
> > +            Name of the GPIO line, its offset as a string or its offset as an
> > +            integer.
> > +
> > +        Returns:
> > +          If id is an integer - it's returned as is (unless it's out of range
> > +          for this chip). If it's a string, the method tries to interpret it as
> > +          the name of the line first and tries too perform a name lookup within
> > +          the chip. If it fails, it tries to convert the string to an integer
> > +          and check if it represents a valid offset within the chip and if
> > +          so - returns it.
> > +        """
> > +        self._check_closed()
>
> > +        if not isinstance(id, int):
>
> Why not use positive conditional here and everywhere in the similar cases?
>
>         if isinstance():
>                 ...
>         else
>                 ...
>
> > +            try:
> > +                return self._chip.map_line(id)
> > +            except OSError as ex:
> > +                if ex.errno == ENOENT:
>
> > +                    try:
> > +                        offset = int(id)
> > +                    except ValueError:
> > +                        raise ex
>
> How this can be non-exceptional? I don't see how id can change its type from
> non-int (which is checked above by isinstance() call) to int?
>

It's explained in the pydoc for this method. :)

If the line ID is not an int, try to map the name to an offset, if it
fails, try to convert it to offset from whatever type (officially only
string but it's python) was supplied.

> > +                else:
> > +                    raise ex
>
> Last time I have interaction with Python and developers who write the code
> in Python the custom exception class was good thing to have. Is this changed
> during the times?
>

We do have custom exceptions, see gpiod/exception.py. It's just that
in this case we want to propagate whatever exception was raised by
libgpiod - OSError translates directly from errno.

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
> > +        return self._chip.get_line_info(self.map_line(line), watch)
> > +
> > +    def get_line_info(self, line: Union[int, str]) -> LineInfo:
> > +        """
> > +        Get the snapshot of information about the line at given offset.
> > +
> > +        Args:
> > +          line:
> > +            Offset or name of the GPIO line to get information for.
> > +
> > +        Returns:
> > +          New LineInfo object.
> > +        """
> > +        return self._get_line_info(line, watch=False)
> > +
> > +    def watch_line_info(self, line: Union[int, str]) -> LineInfo:
> > +        """
> > +        Get the snapshot of information about the line at given offset and
> > +        start watching it for future changes.
> > +
> > +        Args:
> > +          line:
> > +            Offset or name of the GPIO line to get information for.
> > +
> > +        Returns:
> > +          New gpiod.LineInfo object.
> > +        """
> > +        return self._get_line_info(line, watch=True)
> > +
> > +    def unwatch_line_info(self, line: Union[int, str]) -> None:
> > +        """
> > +        Stop watching a line for status changes.
> > +
> > +        Args:
> > +          line:
> > +            Offset or name of the line to stop watching.
> > +        """
> > +        self._check_closed()
> > +        return self._chip.unwatch_line_info(self.map_line(line))
>
> > +    def wait_info_event(
> > +        self, timeout: Optional[Union[timedelta, float]] = None
> > +    ) -> bool:
>
> pylint (btw, do you use it?) has a limit of 100 for a long time. The above can
> be places on one line.
>

I use black and it enforces a 88 character limit.

> > +        """
> > +        Wait for line status change events on any of the watched lines on the
> > +        chip.
> > +
> > +        Args:
> > +          timeout:
> > +            Wait time limit represented as either a datetime.timedelta object
> > +            or the number of seconds stored in a float.
> > +
> > +        Returns:
> > +          True if an info event is ready to be read from the chip, False if the
> > +          wait timed out without any events.
> > +        """
> > +        self._check_closed()
> > +
> > +        return poll_fd(self.fd, timeout)
> > +
> > +    def read_info_event(self) -> InfoEvent:
> > +        """
> > +        Read a single line status change event from the chip.
> > +
> > +        Returns:
> > +          New gpiod.InfoEvent object.
> > +
> > +        Note:
> > +          This function may block if there are no available events in the queue.
> > +        """
> > +        self._check_closed()
> > +        return self._chip.read_info_event()
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
>
> > +            if isinstance(lines, int) or isinstance(lines, str):
> > +                lines = (lines,)
>
> Instead of putting str and int objects into one bucket, handling exceptions,
> etc, I would rather see two methods (one per type).
>

But I very much want to leverage python's dynamic typing and allow
mixing the two.

Bartosz

> > +            for line in lines:
> > +                offset = self.map_line(line)
> > +                offsets.append(offset)
> > +                if isinstance(line, str):
> > +                    name_map[line] = offset
> > +                    offset_map[offset] = line
> > +
> > +            if settings is None:
> > +                settings = LineSettings()
> > +
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
> > +
> > +        return request
> > +
> > +    def __repr__(self) -> str:
> > +        """
> > +        Return a string that can be used to re-create this chip object.
> > +        """
> > +        if not self._chip:
> > +            return "<Chip CLOSED>"
> > +
> > +        return 'Chip("{}")'.format(self.path)
> > +
> > +    def __str__(self) -> str:
> > +        """
> > +        Return a user-friendly, human-readable description of this chip.
> > +        """
> > +        if not self._chip:
> > +            return "<Chip CLOSED>"
> > +
> > +        return '<Chip path="{}" fd={} info={}>'.format(
> > +            self.path, self.fd, self.get_info()
> > +        )
> > +
> > +    @property
> > +    def path(self) -> str:
> > +        """
> > +        Filesystem path used to open this chip.
> > +        """
> > +        self._check_closed()
> > +        return self._chip.path
> > +
> > +    @property
> > +    def fd(self) -> int:
> > +        """
> > +        File descriptor associated with this chip.
> > +        """
> > +        self._check_closed()
> > +        return self._chip.fd
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
