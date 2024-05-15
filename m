Return-Path: <linux-gpio+bounces-6402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC988C685E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 16:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38C86B24469
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 14:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221A913F438;
	Wed, 15 May 2024 14:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5Y2HyzA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675EC13F430
	for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715782482; cv=none; b=ZMHbRPhdiOHPiCjzhaTVUx/OKM2vLLcp/ShGQc97cVsG0o/ekvIcP4ccmD0HfjO5P86ONDm5P3kKqi3w6ftVNgkeS5M1fw6VHvDFmNE8g4Pd+mq7Fvw+YWig/jE/vEovlKXfSwCo88T7+Iw3Yi3rK3q5TQ7vglI3HPjcZBJvK28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715782482; c=relaxed/simple;
	bh=eNYCl/RARwGuN9wu2MxHUtDtmxT4zTzhqmEhlUSw8N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tp3Z2VUNk30+ydW6fxMrvwDYk+8Krp2Uvx0lfEa9r+GJ+8leDOn1KNZzNHme/SLvhLhz5wXbdp+Q0skb6/uDgyfcJc7qeDJ3UwlKXou+WEULihlAQWtdCA8KxRNyaeRdP6UStRNBQpgQrCht08lgE9ig3IGeSTotv6Tm2NzEFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5Y2HyzA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f467fb2e66so6121806b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 07:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715782480; x=1716387280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j/4Bv7OwCGecvDCyfy72CjO7TPQPJr5iD2fwBHl+MZM=;
        b=J5Y2HyzASPwtx4Fjc0Zgi/YLr0xPvn8sqDwhA4l59/vvzmeA1wyeFcx8SVHRfaodwQ
         MZYQpPoCcheoOlZlnbPBrgVdm8e/iTEY5vEk725iQCw0HPX1K+fZHez1IBn2KHWhTGvC
         bCZ+8yp7LtDCLmhTb8+8i9WAzv72yrvJmAN29Lvb9/akPxhGBSYN+KQz/dU4hxOCHqh+
         zWWWg4I8uXlUk0LtmGmM85R4DgZtd4huWCiBh4bxwrgEqbo+UeGnkjiMsYjFA9LjxlmV
         FAqEBmfQBOaDXM+pum4doAnfzd2W192YyJnNESgfyfVOUTuQcHIh57PfUSkuyqnHzZsY
         pkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715782480; x=1716387280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/4Bv7OwCGecvDCyfy72CjO7TPQPJr5iD2fwBHl+MZM=;
        b=RgQydXaypICN6HhWkJ3Oi8uN4DSuxMzrUWkZMBNEcJNcvUe2b/jiZcgAF+BmOTcJbg
         WoL00amw27N4wFMwyXhV+Isk9vUDZHGQPyMtXOwL5N5jCGPA8D062tqYuqdUjmICrK9t
         vMKAt2lVJKw5eKxbHAqmSwkfPcR02kGYB0HSzXKPAomh3dgGWgE+Bhs+jeHIHotI+aZF
         i0ayjpkoCGUtbuIT9Dx/QWbmvZ4WaDkdK9vgPOKGCFLUTng45ikLHiX70PnPyBrd5kuz
         h3VYMI5j66AcJ/rh0EUD40XkC/jxutSgeCEpX0LdIN0UyFn9gsA2X7gM8iaP//7/MmCl
         mU0w==
X-Gm-Message-State: AOJu0Yy5BMc2HIbsfhaschodKXkHim/RvRUCKA1LlUR8Lz1kHx44uqG5
	7U4esWOVXhdQ9xnZXj8kG0pmXoa6MHznIgp+WHEvaBUde6gGRbnVAWsEiw==
X-Google-Smtp-Source: AGHT+IGLBaLFw7oMVlCTg3Dbz0gYBYxm/WhcAhmnzBCd8eoarm8Ob/U55yhBlfLHmRW+WR7cO+FuXQ==
X-Received: by 2002:a05:6a21:339f:b0:1af:dbe7:ccbe with SMTP id adf61e73a8af0-1afde103d87mr20723846637.28.1715782480266;
        Wed, 15 May 2024 07:14:40 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2b53sm11105158b3a.151.2024.05.15.07.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 07:14:39 -0700 (PDT)
Date: Wed, 15 May 2024 22:14:36 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240515141436.GA349711@rigel>
References: <20240507022106.GC26136@rigel>
 <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel>
 <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <20240513101331.GB89686@rigel>
 <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
 <20240514133804.GA107324@rigel>
 <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>
 <20240515091848.GA86661@rigel>
 <CAMRc=MeBGJwyKBTYD1PQkk940t6ECsBxHCprjFUx1KFSKMe7fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeBGJwyKBTYD1PQkk940t6ECsBxHCprjFUx1KFSKMe7fw@mail.gmail.com>

On Wed, May 15, 2024 at 06:54:15AM -0700, Bartosz Golaszewski wrote:
> On Wed, 15 May 2024 11:18:48 +0200, Kent Gibson <warthog618@gmail.com> said:
> >
> > Sure thing.  This is what I have at the moment (the declarations are as
> > per earlier, just renamed.  And I just noticed some variables I haven't
> > renamed.  I'll add it to the todo list.):
> >
> > diff --git a/lib/line-request.c b/lib/line-request.c
> > index b76b3d7..5af23e0 100644
> > --- a/lib/line-request.c
> > +++ b/lib/line-request.c
> > @@ -305,3 +305,200 @@ gpiod_line_request_read_edge_events(struct gpiod_line_request *request,
> >
> >  	return gpiod_edge_event_buffer_read_fd(request->fd, buffer, max_events);
> >  }
> > +
> > +static struct gpiod_line_request *
> > +ext_request(const char  *path, unsigned int offset,
> > +	    enum gpiod_line_direction direction,
> > +	    enum gpiod_line_value value)
> > +{
> > +	struct gpiod_line_request *request = NULL;
> > +	struct gpiod_line_settings *settings;
> > +	struct gpiod_line_config *line_cfg;
> > +	struct gpiod_chip *chip;
> > +	int ret;
> > +
> > +	chip = gpiod_chip_open(path);
> > +	if (!chip)
> > +		return NULL;
> > +
> > +	settings = gpiod_line_settings_new();
> > +	if (!settings)
> > +		goto close_chip;
> > +
> > +	gpiod_line_settings_set_direction(settings, direction);
> > +	if (direction == GPIOD_LINE_DIRECTION_OUTPUT)
> > +		gpiod_line_settings_set_output_value(settings, value);
> > +
> > +	line_cfg = gpiod_line_config_new();
> > +	if (!line_cfg)
> > +		goto free_settings;
> > +
> > +	ret = gpiod_line_config_add_line_settings(line_cfg, &offset, 1,
> > +						  settings);
> > +	if (ret)
> > +		goto free_line_cfg;
> > +
> > +	request = gpiod_chip_request_lines(chip, NULL, line_cfg);
> > +
> > +free_line_cfg:
> > +	gpiod_line_config_free(line_cfg);
> > +
> > +free_settings:
> > +	gpiod_line_settings_free(settings);
> > +
> > +close_chip:
> > +	gpiod_chip_close(chip);
> > +
> > +	return request;
> > +}
> > +
> > +GPIOD_API struct gpiod_line_request *
> > +gpiod_ext_request_input(const char  *path, unsigned int offset)
> > +{
> > +	return ext_request(path, offset, GPIOD_LINE_DIRECTION_INPUT, 0);
> > +}
> > +
> > +GPIOD_API struct gpiod_line_request *
> > +gpiod_ext_request_output(const char  *path, unsigned int offset,
> > +			 enum gpiod_line_value value)
> > +{
> > +	return ext_request(path, offset, GPIOD_LINE_DIRECTION_OUTPUT, value);
> > +}
> > +
> > +static struct gpiod_line_settings *
> > +ext_line_settings(struct gpiod_line_request * olr)
> > +{
> > +	struct gpiod_line_settings *settings = NULL;
> > +	struct gpiod_line_info *line_info;
> > +	struct gpiod_chip *chip;
> > +	char path[32];
> > +
> > +	assert(olr);
> > +
> > +	if (olr->num_lines != 1) {
> > +		errno = EINVAL;
> > +		return NULL;
> > +	}
> > +
> > +	/*
> > +	 * This is all decidedly non-optimal, as generally the user has the
> > +	 * config available from when they made the request, but here we need to
> > +	 * rebuild it from the line info...
> > +	 */
>
> Yeah, I hate it...
>

I wasn't expecting any love for it - it is ugly.
But it does the job.

> I would assume hogging memory for config structs is still cheaper than all these
> operations needed to reread the settings for a line. Not to mention the fact
> that if we ever extend the settings, we'll need to remember to update this
> routine too.
>

It shouldn't be used often, so I'm fine with the overhead.
The benefit is it uses a standard line-request.
If the user isn't hapopy with the overhead then they can use the core API.

And the function only has to deal with the config that is settable via
ext.  If you have set config via the core API then what the hell are you
doing calling one of these?

> The users of the _ext_ functions most likely wouldn't care whether the context
> is stored in struct gpiod_line_request or struct gpiod_ext_request or otherwise.
>

Yeah, but then they can't use the existing gpiod_line_request_XXX functions
can they?  At least not without going through an accessor to pull the
line_request from the ext_request.

> > +	memcpy(path, "/dev/", 5);
> > +	strncpy(&path[5], olr->chip_name, 26);
> > +	chip = gpiod_chip_open(path);
> > +	if (!chip)
> > +		return NULL;
> > +
> > +	// get info
> > +	line_info = gpiod_chip_get_line_info(chip, olr->offsets[0]);
> > +	gpiod_chip_close(chip);
> > +	if (!line_info)
> > +		return NULL;
> > +
> > +	if (gpiod_line_info_get_direction(line_info) != GPIOD_LINE_DIRECTION_INPUT) {
> > +		errno = EINVAL;
> > +		goto free_info;
> > +	}
> > +
> > +	settings = gpiod_line_settings_new();
> > +	if (!settings)
> > +		goto free_info;
> > +
> > +	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
> > +	gpiod_line_settings_set_bias(settings,
> > +		gpiod_line_info_get_bias(line_info));
> > +	gpiod_line_settings_set_edge_detection(settings,
> > +		gpiod_line_info_get_edge_detection(line_info));
> > +	gpiod_line_settings_set_debounce_period_us(settings,
> > +		gpiod_line_info_get_debounce_period_us(line_info));
> > +
> > +free_info:
> > +	gpiod_line_info_free(line_info);
> > +
> > +	return settings;
> > +}
> > +
> >
> > Oh, I also added this:
> >
> > +/**
> > + * @brief The size required to contain a single edge event.
> > + * @return The size in bytes.
> > + */
> > +size_t gpiod_edge_event_size();
> > +
> >
> > So users can perform the event read themselves without requiring any
> > knowledge of event buffers (at the moment they can't determine the size
> > required to perform the read).
> >
>
> Can you post an example of how this is used?
>

Sure [1].

> > I also intend to provide an updated set of examples that use the ext API.
> > They should go in examples/ext?
> >
>
> I think the code should go into ext/, the gpiod-ext.h header can go right next
> to gpiod.h in include/ and the examples can be in the same examples/ directory,
> just call them something_something_ext.c to indicate they use the simpler API.
>
> Does that sound right?
>

At the moment I've made the code a conditionally compiled block in
line-request.c, so it can directly use the line-request internals.
Pretty sure that can be changed to use the core API, but isn't pimpl within
the library itself a tad extreme?

Cheers,
Kent.

[1] https://github.com/warthog618/libgpiod/blob/ext/examples/ext/async_watch_line_value.c

