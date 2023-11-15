Return-Path: <linux-gpio+bounces-183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F537EC970
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 18:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99AEFB20BC3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 17:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3EB28387;
	Wed, 15 Nov 2023 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YdE9Wrlv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DC428382
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 17:10:52 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BF2196
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 09:10:51 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6d261cb07dcso4379341a34.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 09:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700068251; x=1700673051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sg1GfTPZ0gor5qGEo5yfXBSN25SIukbC+PratdWXctI=;
        b=YdE9WrlvnKLckJMGI2/3Ogo5UhEAOCw39ylnGuvkd+j/mQEm6sv4Wyp/F6HJvLPTs+
         IB4RQsuUwxTjoWm+V95fKu2ZvyEsDD5ORnWpBHcBhe2a8pcEDeZOj6IHEJ5R6tTwol4k
         F+He/zhUvlDRNCeC2szALc7d2jxFSMA0RAl5rhTs1njmS3sYtHZ+sA8zmxcfWrqTgMh2
         9O9nJou/uZqL7XJgU3Zh06hbvZca9nnn+teJT28uVhTg8iOgyhcBEMFu0V76um0kNvCF
         TVcDeEKT518a33v8WchbExHU8QLVFr15kLxq9dAQVfoD7fLtYGozVkiLhY3JW2BszV1d
         wgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700068251; x=1700673051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg1GfTPZ0gor5qGEo5yfXBSN25SIukbC+PratdWXctI=;
        b=iF6CuzKssupIcsQmUDgsolII0f1ZztpRgwIxqiaRK6XL46QxMeW5gw50XRoI5Moa8v
         wL4l+RnTYNE+w3wpmZKNa4RiIoph6NMilqvNGvMLf+Zw68lxqlGjn+A0It+qqJ0KlDry
         XTg4zdV7gZMwyrZZh57Ves+HR0GjMJBtmIGXnjytUOHpcgeqbf36WYeOyutzs4nph9sl
         VQZ0TTvIR/W51oYYDe5J42KD42dMg3YisFejESxmpw7XCTmvCTRFyjEjF1yfcq8SK2d5
         lFGnb778YWlEmqdLL6VIOhf9PA0PRFRcGQgKyIIzpwlPMf3uVQ64zHObGHh7sJ901VVy
         YGgQ==
X-Gm-Message-State: AOJu0Yz5R9QsKMZmH/WD5DwHOrDqkY9n9TFpVqfwEmoHQJOxhmBFtM5/
	I8h6/RCn9HjYrdLbinfub3sCV+oir3pCS812iZtUBg==
X-Google-Smtp-Source: AGHT+IE9wfAwt/wzf2lwZ9u3DTaE/IqWMgQUUTbmzjOg50RV86y3/e1U35OzGvPtn/It0GKoFRfwDlpV2+FHER6Vkww=
X-Received: by 2002:a05:6358:528a:b0:16b:c5ca:96e4 with SMTP id
 g10-20020a056358528a00b0016bc5ca96e4mr6447489rwa.2.1700068250872; Wed, 15 Nov
 2023 09:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113143219.43498-1-zinger.ad@gmail.com> <CWXV8TMDNK59.WFY7K99MD7KQ@ablu-work>
 <CWYGBJ6SZ2UH.2S7NPDBHCGPIL@Kalray-lp232>
In-Reply-To: <CWYGBJ6SZ2UH.2S7NPDBHCGPIL@Kalray-lp232>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Nov 2023 18:10:40 +0100
Message-ID: <CAMRc=MfgCTF-+0Dkw644piScYH__gcfBHL2EKW18vWt0WXeDvA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] libgpiod: Allow to gracefully exit from a wait event
To: Adrien Zinger <zinger.ad@gmail.com>
Cc: Erik Schilling <erik.schilling@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 11:10=E2=80=AFAM Adrien Zinger <zinger.ad@gmail.com=
> wrote:
>
> > This sounds like an oddly specific API... I wonder, why does
> > gpiod_line_request_get_fd [1] + doing the polling in your code
> > not work
> > for you? Since you already got a file descriptor for the
> > notification that seems like little extra work. Or
> > did you consider that but find
> > it too verbose?
>
> Until now it works like you said and it's not so verbose.
>
> Actually I had the issue some weeks ago. And before digging inside the
> library I have searched in the documentation and also asked on
> stackoverflow [1] for a suggestion. Despite everything me and other
> developers were not able to guess how to cancel a wait event from
> another thread, without reading the code of the library. I thought
> that it could be a good thing to provide that feature.
>
> [1]
> https://stackoverflow.com/questions/77222869/how-to-gracefully-cancel-gpi=
od-line-event-wait
>
> Best regards,
> Adrien
>
>

I agree with Erik, this looks like a very specific (obscure?) use-case
that's best implemented in-place using the fd getter. I try to keep
the library minimal and simple and this doesn't seem like a good fit
IMO.

Bart

