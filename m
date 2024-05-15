Return-Path: <linux-gpio+bounces-6401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A2A8C67CE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 15:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 021311C219CE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 13:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99E213EFEC;
	Wed, 15 May 2024 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JjGBUu8m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2BD12F372
	for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781260; cv=none; b=jQpCO7VV2Llg/yYean9xwXZgHTssy/I3orlsQW4Qfwwux2hJiWXNaV8HSwcsqFu9HxPszx+gQTrFmnvfLC45BaA/kBIuKYH1UA3FKVGfXnLIz686qxtq0zRZ8YpI+0MsO1NP+6XKdCHfK96junRY8c55LWP1FLJ/ZJefviVR8Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781260; c=relaxed/simple;
	bh=hQu6+Ed01uinAFhR5YyXszrFxp4oBeMUfg3eJTPR2qs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZSbBNjs96W0Cv6El2qnWXcB2jyhjYcY2DnwZ1WMo+w8L7PgKQ2ahEYeqRKgTOYsMDpYPbyhOvPKmmrsy+NH7cH6PisjoTMCnh5fZCBCokkRnjxZnqu3rdx3NcLeSsq4uRVeOG3AONObbmoVhmooHMEO+V5Ku0pUydSFuIfYf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JjGBUu8m; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e3e18c240fso77254531fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715781256; x=1716386056; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+DaFl+mNZKkQmN/PRrksB7YwAKQiAPOK0fwtjbvKgBY=;
        b=JjGBUu8mJi5vkVJixiB7le6fJOWvf/4ejh70/4voDaU9baqAUmcZfQ79L+hTfDbdGk
         IBZVu4ZK68/8jXC4eksW+VN6f74tbUB5oG4HmTGHCsW5BGBtofMCZi3cSJ9o2pC7f0QL
         EF7df+u8TwR8+CZD6Re5PQiKRYPVep53Y712hhro4PFKz0IoPCwogBcRTC6qNw+y9zIS
         LThJLO/2FGc38vCcm+M6C9u+LkUT1iJRyEgxn0/J5BIuxean+25L0FanCIbZbzL8xvNs
         /FEcCOOVncfEL3OYIz4OTL5kGKam9CCcI7xvzzGiRcEAZX6l156aHNwiPEYaEmXZPAF2
         Qviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715781256; x=1716386056;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+DaFl+mNZKkQmN/PRrksB7YwAKQiAPOK0fwtjbvKgBY=;
        b=WcTTQD2xqXS3wSrUxfiqEf82cdes4YsOMcInXNa8FDbuTAtsYWcWTatDh90OP4Wzzv
         p9Bbx2RVKCSIJw+gOY9Ex//f0jTAGmlXjUpDspIzEdHrx+kP68idLk8IfbPevEuPghCo
         mLWSBGHV/JvJVfOzWzbeOb/i8ESS/Rn9nEDgjCZXgXLyIhdOkm0VrGTzvkVnsT/SYpEx
         Wyjr5O03SxSAVcUkBi7m7BQS9AgY3que71JIp+eq29NL261vNQ4Ova+h7aAJCjAwCyZb
         DpHb9diWmHMGHuva6m26R0tgWowC5IoXL060MxNgnetOmqQtbUZ+GigiSY6UAFPCB4mW
         pfPA==
X-Gm-Message-State: AOJu0YwCe1yutkjZYXEqRJDUZEzZSG+DLnuoQU678f6U3b/ssIxs/qSL
	3n4S+aWrS3U4+IwLoOX2VMWysGj4tZVgHDUxoIEIpeABAUtBPKJIlsHhi89LP/2NdxBX8xUh1PC
	epCekILF7Ddh7SH92QcPy64UMGsbpL7p2TkgZXA==
X-Google-Smtp-Source: AGHT+IEfzY6JIyv9YjbJPJQv3z3pHJ5sM+7OOE78U5Q6FivVov7SbQHknxfWCkNTF2+rBI92SsbG7bz2k2DPvgs+O7c=
X-Received: by 2002:a2e:840b:0:b0:2dd:ccb6:e836 with SMTP id
 38308e7fff4ca-2e51ff5d46dmr134184261fa.25.1715781256355; Wed, 15 May 2024
 06:54:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 May 2024 06:54:15 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20240515091848.GA86661@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507022106.GC26136@rigel> <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel> <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <20240513101331.GB89686@rigel> <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
 <20240514133804.GA107324@rigel> <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>
 <20240515091848.GA86661@rigel>
Date: Wed, 15 May 2024 06:54:15 -0700
Message-ID: <CAMRc=MeBGJwyKBTYD1PQkk940t6ECsBxHCprjFUx1KFSKMe7fw@mail.gmail.com>
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 May 2024 11:18:48 +0200, Kent Gibson <warthog618@gmail.com> said:
>
> Sure thing.  This is what I have at the moment (the declarations are as
> per earlier, just renamed.  And I just noticed some variables I haven't
> renamed.  I'll add it to the todo list.):
>
> diff --git a/lib/line-request.c b/lib/line-request.c
> index b76b3d7..5af23e0 100644
> --- a/lib/line-request.c
> +++ b/lib/line-request.c
> @@ -305,3 +305,200 @@ gpiod_line_request_read_edge_events(struct gpiod_line_request *request,
>
>  	return gpiod_edge_event_buffer_read_fd(request->fd, buffer, max_events);
>  }
> +
> +static struct gpiod_line_request *
> +ext_request(const char  *path, unsigned int offset,
> +	    enum gpiod_line_direction direction,
> +	    enum gpiod_line_value value)
> +{
> +	struct gpiod_line_request *request = NULL;
> +	struct gpiod_line_settings *settings;
> +	struct gpiod_line_config *line_cfg;
> +	struct gpiod_chip *chip;
> +	int ret;
> +
> +	chip = gpiod_chip_open(path);
> +	if (!chip)
> +		return NULL;
> +
> +	settings = gpiod_line_settings_new();
> +	if (!settings)
> +		goto close_chip;
> +
> +	gpiod_line_settings_set_direction(settings, direction);
> +	if (direction == GPIOD_LINE_DIRECTION_OUTPUT)
> +		gpiod_line_settings_set_output_value(settings, value);
> +
> +	line_cfg = gpiod_line_config_new();
> +	if (!line_cfg)
> +		goto free_settings;
> +
> +	ret = gpiod_line_config_add_line_settings(line_cfg, &offset, 1,
> +						  settings);
> +	if (ret)
> +		goto free_line_cfg;
> +
> +	request = gpiod_chip_request_lines(chip, NULL, line_cfg);
> +
> +free_line_cfg:
> +	gpiod_line_config_free(line_cfg);
> +
> +free_settings:
> +	gpiod_line_settings_free(settings);
> +
> +close_chip:
> +	gpiod_chip_close(chip);
> +
> +	return request;
> +}
> +
> +GPIOD_API struct gpiod_line_request *
> +gpiod_ext_request_input(const char  *path, unsigned int offset)
> +{
> +	return ext_request(path, offset, GPIOD_LINE_DIRECTION_INPUT, 0);
> +}
> +
> +GPIOD_API struct gpiod_line_request *
> +gpiod_ext_request_output(const char  *path, unsigned int offset,
> +			 enum gpiod_line_value value)
> +{
> +	return ext_request(path, offset, GPIOD_LINE_DIRECTION_OUTPUT, value);
> +}
> +
> +static struct gpiod_line_settings *
> +ext_line_settings(struct gpiod_line_request * olr)
> +{
> +	struct gpiod_line_settings *settings = NULL;
> +	struct gpiod_line_info *line_info;
> +	struct gpiod_chip *chip;
> +	char path[32];
> +
> +	assert(olr);
> +
> +	if (olr->num_lines != 1) {
> +		errno = EINVAL;
> +		return NULL;
> +	}
> +
> +	/*
> +	 * This is all decidedly non-optimal, as generally the user has the
> +	 * config available from when they made the request, but here we need to
> +	 * rebuild it from the line info...
> +	 */

Yeah, I hate it...

I would assume hogging memory for config structs is still cheaper than all these
operations needed to reread the settings for a line. Not to mention the fact
that if we ever extend the settings, we'll need to remember to update this
routine too.

The users of the _ext_ functions most likely wouldn't care whether the context
is stored in struct gpiod_line_request or struct gpiod_ext_request or otherwise.

> +	memcpy(path, "/dev/", 5);
> +	strncpy(&path[5], olr->chip_name, 26);
> +	chip = gpiod_chip_open(path);
> +	if (!chip)
> +		return NULL;
> +
> +	// get info
> +	line_info = gpiod_chip_get_line_info(chip, olr->offsets[0]);
> +	gpiod_chip_close(chip);
> +	if (!line_info)
> +		return NULL;
> +
> +	if (gpiod_line_info_get_direction(line_info) != GPIOD_LINE_DIRECTION_INPUT) {
> +		errno = EINVAL;
> +		goto free_info;
> +	}
> +
> +	settings = gpiod_line_settings_new();
> +	if (!settings)
> +		goto free_info;
> +
> +	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
> +	gpiod_line_settings_set_bias(settings,
> +		gpiod_line_info_get_bias(line_info));
> +	gpiod_line_settings_set_edge_detection(settings,
> +		gpiod_line_info_get_edge_detection(line_info));
> +	gpiod_line_settings_set_debounce_period_us(settings,
> +		gpiod_line_info_get_debounce_period_us(line_info));
> +
> +free_info:
> +	gpiod_line_info_free(line_info);
> +
> +	return settings;
> +}
> +
>
> Oh, I also added this:
>
> +/**
> + * @brief The size required to contain a single edge event.
> + * @return The size in bytes.
> + */
> +size_t gpiod_edge_event_size();
> +
>
> So users can perform the event read themselves without requiring any
> knowledge of event buffers (at the moment they can't determine the size
> required to perform the read).
>

Can you post an example of how this is used?

> I also intend to provide an updated set of examples that use the ext API.
> They should go in examples/ext?
>

I think the code should go into ext/, the gpiod-ext.h header can go right next
to gpiod.h in include/ and the examples can be in the same examples/ directory,
just call them something_something_ext.c to indicate they use the simpler API.

Does that sound right?

Bart

