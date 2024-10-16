Return-Path: <linux-gpio+bounces-11412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EE29A04B8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 10:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34B4C1C21F6F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 08:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34599156665;
	Wed, 16 Oct 2024 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qnHfL3YX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA5F1D8DF8
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729068774; cv=none; b=tlSl/z7/HGJaRdVDKC0fPoL9qx+/qYQaJsh9qT0H+vSs5+vp6zueQoILGDHd4pnQ9pyL6LLFdj8kSn+g3muAlhFmeNrFB4ya65C3dmiQwrv/A7yh0xwS+SrFq0GUnT6pNVMpdjUSqVZj5CrWr4oMbWIPFx9I/R8r8h1AwHw3id0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729068774; c=relaxed/simple;
	bh=Zl6AUao2q0PCw6/rtKxfwwjMM/TujhS79w/v5pxAxJE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEDxkjAedx1c6K0AmaSudAIbqlDffABhkCMH73B5NOmo1Y8JH4M2NUaIfbQGuY/pH/ClpMQ8mgC8PDI7sSGmelP64tVRsIS0MRomtf2kj81UAnpR2pC9oI6kQdZnRjhyO6fpFC9BG3a0bbpVzw7cuqs0B5Kaae+Qqfo4N3btePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qnHfL3YX; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5f647538so7727381fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729068770; x=1729673570; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0hy7to/asUQ2rGxrqnJLvswJAm0JsZmyz2URWQvfclY=;
        b=qnHfL3YX7arog1dZbgfee0ilfz2nuop9KHIBnPiTIsFEutyCxQGBx5wNd1QlP7Dvet
         it61GqmZQBogl/HBrtZF6zn8XJ06UYJWowjmj0J46R8GH7Yxv52YZCX7CyTuH49380hP
         FaQ6tB+Pex2sbJxyUlSXuUJ/f1BDIvf4DPXOa82FrD2Q+/3pHkLAEvY5wcz6wy5m+5L+
         uWhdGtsbU9tbXr/RLlbV/XEeQdqfE2du590e3WBMBgdlONE6u6Z4FgXnkuJpOtEfSS9B
         FspXCrDHc7L30LuJ1zIGbcx+F3PNpsC9YWJWaV61ogG/oMgpIhF5yhGC1qqVtH9MkH4Q
         8I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729068770; x=1729673570;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hy7to/asUQ2rGxrqnJLvswJAm0JsZmyz2URWQvfclY=;
        b=uFtQYQyXqQ+VzcqzW+MGzu59r0yhtXiu+N+9I7tVseqEw2DJZp35h11KXAr+xb2/4b
         54ydp1HyXVzx9KjXpT8Zg2QPylEN2pT/+x5u0mb3KIkYRKI25kNtgVpJohGzhWfAOI0f
         gjKfk6ynET6sY1kv2JL+Mgcj8/+gVvc+emxSYeyPGiXa3XAFXdzE7F8hGbcdT2bUapR0
         dO6ZtT1pNNPBAI9vTDD8eQmEvYDeK2NlAHSSa28f15bpadyANJYD+AkcDatXQOqDKAWE
         5YE43xji81UBcUzFq8pFlLHy2KnIoqy6mumDgF6OLiAqMjH6Kvl3DFZ2fK41ZyHgBH+G
         JMKw==
X-Forwarded-Encrypted: i=1; AJvYcCWU9MP61leeZhq7JmfgkL2Td5bFiRH0ikF5+15GcMi+75qwnhnEmKHgk8iyqcm0VHQjvlIM06/bpw5z@vger.kernel.org
X-Gm-Message-State: AOJu0YyG9sIXcjLx4/ojYivRuSYgKvQyokPyTbZ+f33ztzPjnEB4nDWA
	l/tUtayd1GC4ygtO2WWR5DmXPBJApze1pmM+u68IPLTubEZ9aBR50d3JHdCZX8p94S98/ZIUJi3
	pSeMnAFzfqZxEpl2GgH4vgS0w2gKoaFfGGEzayQ==
X-Google-Smtp-Source: AGHT+IHsHleSm/zY/JTUvhEQyoNIEbPP4chhf3glc9bu2RV9bskTk6R3nEu+KQlJcwWXUSiwJ23aHGKboVUVN9r7yAY=
X-Received: by 2002:a2e:6119:0:b0:2fa:faed:e86b with SMTP id
 38308e7fff4ca-2fb30dfab1bmr46746051fa.13.1729068770309; Wed, 16 Oct 2024
 01:52:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Oct 2024 01:52:49 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20241016083747.GB120095@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel> <20241016072730.GA120095@rigel> <20241016083747.GB120095@rigel>
Date: Wed, 16 Oct 2024 01:52:49 -0700
Message-ID: <CAMRc=McR_eMizF6r30NqbgK4mE5ErzR=wbkD4O-Czn=+Oj4AXQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Oct 2024 10:37:47 +0200, Kent Gibson <warthog618@gmail.com> said:
> On Wed, Oct 16, 2024 at 03:27:30PM +0800, Kent Gibson wrote:
>> On Wed, Oct 16, 2024 at 01:19:44PM +0800, Kent Gibson wrote:
>> > On Tue, Oct 15, 2024 at 12:56:18PM +0200, Bartosz Golaszewski wrote:
>> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> > >
>> > > -	return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
>> > > +	ret = gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
>> > > +	if (ret == 0) {
>> > > +		/* These are the only options we notify the userspace about. */
>> > > +		switch (pinconf_to_config_param(config)) {
>> > > +		case PIN_CONFIG_BIAS_DISABLE:
>> > > +		case PIN_CONFIG_BIAS_PULL_DOWN:
>> > > +		case PIN_CONFIG_BIAS_PULL_UP:
>> > > +		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
>> > > +		case PIN_CONFIG_DRIVE_OPEN_SOURCE:
>> > > +		case PIN_CONFIG_DRIVE_PUSH_PULL:
>> > > +		case PIN_CONFIG_INPUT_DEBOUNCE:
>> > > +			gpiod_line_state_notify(desc,
>> > > +						GPIO_V2_LINE_CHANGED_CONFIG);
>> > > +			break;
>> > > +		default:
>> > > +			break;
>> > > +		}
>> > > +	}
>> > > +
>> > > +	return ret;
>> > >  }
>> >
>> > Ah, the debounce - I forgot about that, and other features that cdev
>> > might emulate.
>> >
>> > What happens if userspace requests a line with debounce that is
>> > supported by hardware?  Seems to me we'll see both a LINE_REQUESTED and a
>> > LINE_CONFIG_CHANGED when the line is requested.
>> >
>>
>> This is problematic for me to test at the moment, as gpiosim doesn't support
>> debounce. Any chance we could make that configurable?  Similarly drive.
>>
>> > Conversely, what if a config change impacts features that don't result in a
>> > notification from gpiod_set_config(), like active low, or emulated
>> > drive or debounce?
>> >
>>
>> Bah, drive is emulated in gpiolib itself, so that should be fine.
>>
>> When changing config cdev always calls gpiod_direction_input/output(), so I
>> think that covers the active low case.
>>
>> But I have a test taking a line from input to output|open_drain and I
>> get two change events.  The first is the most interesting as it reports
>> input|open_drain, the second then reports output|open_drain.
>> That is due to gpiod_direction_output() calling gpiod_set_config() to
>> set the drive, and later to set the direction, in that order.
>> Given it will be setting the direction, it should inhibit the event from
>> the drive setting?
>>
>
> Ok, I oversimplified, it was actually
>
> input -> output|active_low|open_drain
>
> and
>
> input -> output|open_source
>
> fails the same way.
>

Does the following help?

@@ -2830,7 +2860,7 @@ int gpiod_direction_output(struct gpio_desc
*desc, int value)
 			goto set_output_value;
 		/* Emulate open drain by not actively driving the line high */
 		if (value) {
-			ret = gpiod_direction_input(desc);
+			ret = gpiod_direction_input_nonotify(desc);
 			goto set_output_flag;
 		}
 	} else if (test_bit(FLAG_OPEN_SOURCE, &flags)) {
@@ -2839,7 +2869,7 @@ int gpiod_direction_output(struct gpio_desc
*desc, int value)
 			goto set_output_value;
 		/* Emulate open source by not actively driving the line low */
 		if (!value) {
-			ret = gpiod_direction_input(desc);
+			ret = gpiod_direction_input_nonotify(desc);
 			goto set_output_flag;
 		}
 	} else {

>> Still haven't tested any debounce changes...
>>
>
> Have now.
>
> input -> input|debounce
>
> does not report the debounce.  Only get the one event and it does not
> contain any debounce.
>

You mean, you get a CHANGED_CONFIG event but the debounce value is not
in the associated line info?

> Similarly
>
> input -> input|edge|debounce
>
> which exercises a different path through cdev.
>
> Cheers,
> Kent.
>

Bart

