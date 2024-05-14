Return-Path: <linux-gpio+bounces-6368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E734C8C5737
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 15:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16A541C217C3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 13:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC3614533E;
	Tue, 14 May 2024 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WABatfmu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E09B144D0F
	for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715693504; cv=none; b=nXNhEroohGcqUV0SS5XhmiT5nIAuJAetYVkaDb8QNbYcW4napV0qo1vS1D/yGI/du6Ek6bBrNmCclgqH/1ZFReKCiozy6JkUbm3G5larJ7F5AQmSrZ8irsOy8Zu0lO05wR/GIxF/lImEQfyUXT5ckgpTYQMLET6lcxutZhozkzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715693504; c=relaxed/simple;
	bh=owdRR7RGWGosj4kJtoaSZCPcjCmjwyzGWP8SaneZ0Jc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ribt3pR9WzKnX237H/1wFIN+U/KtYnABViC57GfdvD9pMJ39d3lfXBPvO9W7vjZZ+hZaCrb2+cn1uZEpJzFtI1wKRd9CanXFcd/76KAmM5NdhgrqXoOL4n3HzwrRVVq7AOs+Kr4wy+BBoKE8F0lbA7YN/Cc5nCOVoGrtWLSt8Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WABatfmu; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51ef64d051bso6483588e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715693500; x=1716298300; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6F/2/XkRQ4RjV7ry/A318MpTOvgjIqVFhLhA37eGotc=;
        b=WABatfmuL7cBUBIQ/Y8RTklFy8qyxI1N+QkKPvYZkfYVbmdCfr5OKMHkz0YFi4+Gin
         FzNLD80fGzrCW0JZOrgCz4MjbP0egMGUYlpkcggEa1XPc70QXtEUPM+mqMO6ktjHBapJ
         6hMRfPLhJPYihKWFi6gjRYbuLvk0rG4ef1FnAUPbcyK5vF+AuH3laqOBmzEuKjo+LhzM
         7Kc1hwgsSglPTD0VNuzzjrE5yJZa2/Wx6SbHpi7CYnB/2aNpP2rKGSI91MSfXCurFLK4
         w/rBJ/HQ77yg6VoOOF9fIGQCVFSmBnRA8neEEUPuSgvj6phpr4+6srdHtPNCa3F7GCvx
         4l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715693500; x=1716298300;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6F/2/XkRQ4RjV7ry/A318MpTOvgjIqVFhLhA37eGotc=;
        b=TO+/Dkoz3QhUzf81FGsQio6KFaK9CNRZ2ncunOUWRFeuT56feRytDRRoQalWijtH5u
         FFGk2hh15FBAWArP5Hw0uHBCcBrMcGTto3g6XBhtRxR2Woou3Qd2s0E54uqETTZjsnb6
         54Z/ZgOACdZMKCP+uHg1Zz818vGtYzxmlNRGuPzJqstk+vXDViPAx3v7gv/SGPzOtSGo
         FbGOjJpDdtF8ILGjfgmpXzB0mCjRUZOD03a+Y/4JG8VNrrc4BzlsjphgunLFt2NDQeVn
         crVtJ0CgrDPwAXL5SbB7uEcRtKecULKBeRLHqG/zXvqTD1xKPNZ2zYTfoI4UprpDUjxP
         en1Q==
X-Gm-Message-State: AOJu0YxmlxIJ3BE2h+yLuanSR1C2Rjnsnf5X9XhpvIULhM433nmHTelf
	gl4KQM4fNafo4dYN8G1azpVbqrkwK/YX3IClsFYIQEF03aS+XWpiwngdkN/beULMyFP1pe1KGej
	Dnf5LtQkfZJYpZXEZYE+KqDQawdVoMlPcLjLkqaDPK0+yyH4zpQs=
X-Google-Smtp-Source: AGHT+IHOKr6047D8QNYlIFcaFUnnu1mZknl5K2v6q0okJ6KIkcLbQj5qiOJQjufV3g6oLW/yqI5wBLRLuxY7MkwZggg=
X-Received: by 2002:ac2:4253:0:b0:51d:55a7:668d with SMTP id
 2adb3069b0e04-5220fb72dbamr7846310e87.25.1715693500181; Tue, 14 May 2024
 06:31:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 May 2024 06:31:39 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20240513101331.GB89686@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507022106.GC26136@rigel> <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel> <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <20240513101331.GB89686@rigel>
Date: Tue, 14 May 2024 06:31:39 -0700
Message-ID: <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 May 2024 12:13:31 +0200, Kent Gibson <warthog618@gmail.com> said:
>
>> > /**
>> >  * @brief Set the bias of requested input line.
>> >  * @param olr The request to reconfigure.
>> >  * @param bias The new bias to apply to requested input line.
>> >  * @return 0 on success, -1 on failure.
>> >  */
>> > int gpiod_olr_set_bias(struct gpiod_line_request * olr,
>> > 		       enum gpiod_line_bias bias);
>>
>> For this to work, you'd most likely need a new struct wrapping the request
>> and also storing the line config. Otherwise - how'd you keep the state of all
>> the other line settings?
>>
>
> Yeah, I realised that when I went to implement it :(.
>
> What I implemented was to read the line info and build the config from that.
> So no impact on core.
> Not the most efficient, but for this use case I wan't fussed.
>

I think those simplified requests should wrap the config structures, otherwise
we'd have to readback the config from the kernel which would become quite
complex for anything including more than one line.

>> We'd keep the clear distinction between the low-level, core C library wrapping
>> the kernel uAPI and the user-friendly C API. Though the user-friendly API in my
>> book could be the GLib library but I understand not everyone wants to use GLib
>> nor is familiar with GObject.
>>
>
> Sorry, still haven't had a chance to look at the GLib API.
> But if it involves any additional overhead or learning curve then it
> wont be well received.
>

Yes, unfortunately GLib & GObject are quite different from most of the regular
C programming.

Bart

