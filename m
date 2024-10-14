Return-Path: <linux-gpio+bounces-11295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D199C589
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 11:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8791D28353E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644EB1527BB;
	Mon, 14 Oct 2024 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9RtwBxo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC34814A609;
	Mon, 14 Oct 2024 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728897897; cv=none; b=RnKGzOesLvqLjgOwojxHgmEY0AngAmendAywRASV0js6UOZfViVz970ARx+xsi6jFX7TUtxKlwZKvTfv3ExilNFBvrf8j5TvO96zPCsa2vpvkMv0TSzsZ01cNtJ2+5L/FNl+bltm4rJCmAAIP5+eMvOLuur9N2i+hTyQ2CiXstY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728897897; c=relaxed/simple;
	bh=yS/xB8YUZYV+RbxXsf65imW+aDB+OfACrX4WD2UjDd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzIWsLjbW/1PBXkwBhRXqiKIQm8W5XoyyuFlX1nRBO0AhCM9Rqc9+HIHlAFEHf4VFzOsux8V2KSry/XC8mvYJGORLqURYfayk2c2gmR4ERkw4tfFRkyPgzq3grmBTBhbtP301+l6Axiy8RK66mxJw9WObTpb+ght11gwXRygRDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9RtwBxo; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea8d7341e6so379403a12.3;
        Mon, 14 Oct 2024 02:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728897895; x=1729502695; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zQ+6FboYkuocFqanh7ADwWgW/Y3+eUfDfbCDmXW9GgE=;
        b=l9RtwBxoCcfC8a6vuc7Thc1ybJBy+R8Vt7QHikgNRcTrdvjqKcGdy+AyWDxOogm0Zu
         X1uMA4rAXrohF2mUyrST8OPlBXYvrE9aqDfeA6MjxdcxLNafVlcgpIyudBxC8RJFE+2Y
         Cp8vyB/oAwR4MLe/Vnt0bTJhiznybn98rIMkAgbxMI1pIguL+i3QL7Go2oOI8FMdNnBm
         ZNKkY92MI31UBk9//m7XgrVifSeDt6p7G6IbMMx59Pcb1I13oiTisLmyD/yVt8lHt08J
         gtQP4l86Gs4X2JaVhQmtSS92M1CXbKrRxi8JHyseuzY4G6/v0qQ1fTg7TtO1A3GvuopD
         X1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728897895; x=1729502695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQ+6FboYkuocFqanh7ADwWgW/Y3+eUfDfbCDmXW9GgE=;
        b=Yo5yV8BZbnneooxLPRTZbfD7hZHqUKz3wX4PEHPn1rPtaZvBeAZidBnMktxj4GZ/qF
         LC2aXh43ceGuJAaS8RfL2ouE2y+gLPRhpP92NLNMqPfFBKpbtu7OTRPZ7VPGAtF17tQW
         RDc7XhtdiBnrH+RuvSNB9RAaZiEaQOqx4f5kqyUrG1Ck5QBy1srKFdXR08h1wQq4Hwnm
         1h7lfttJdzItjNT56/684vLfiEIMflTZNk02KLExDFRxJRq1ufOr/jBHFIho0OyiKp32
         pxaqVDO9Ls6pbdkmZacRxIQBbS9MEPjK+/D7kWmzXvOJIa7gGp6Nk5i6qRV7Vb5V3RGN
         L+kA==
X-Forwarded-Encrypted: i=1; AJvYcCX8lbBrurhbu8j9/WiLsiodne2jnd5oqFwZ0tSfv4ETaRmcvGUMF7U14OjnhfEJTxLdS5SDsY5mq7BZ@vger.kernel.org, AJvYcCXp3tsmiWRBjRHL/hd+diPqTZs8vME2aHmzGO8FkV0PWzRb04gFUMLixou5eM2lVuCeK1iwTqRU5ccTts6z@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp+/CHm0mwzuCARJEnATWU2elRqSttkMe24iAWeiRxwWAixBat
	W2RIf+mSxZtDRxp95DOgzSThwPS3BZ4BJNQTYlsc1J2mIGhbaDKz
X-Google-Smtp-Source: AGHT+IG5n3FzzdPtPjSkdXv1RobJGT12jgGGgTkIj0EDAaGMsD0uE86LKw4XVDC2GJxtPWOAg0utCQ==
X-Received: by 2002:a05:6a21:4006:b0:1cf:9a86:73e4 with SMTP id adf61e73a8af0-1d8bcf12513mr21017028637.14.1728897895090;
        Mon, 14 Oct 2024 02:24:55 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea61fc9cc6sm4665290a12.79.2024.10.14.02.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 02:24:54 -0700 (PDT)
Date: Mon, 14 Oct 2024 17:24:50 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 5/6] gpiolib: switch the line state notifier to atomic
Message-ID: <20241014092450.GA101913@rigel>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-5-b560411f7c59@linaro.org>
 <20241014021140.GC20620@rigel>
 <CAMRc=MeoSnr-z=fmfRoTU-vdL_BAkTAE+0HiBaVUWmFG-bOTPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeoSnr-z=fmfRoTU-vdL_BAkTAE+0HiBaVUWmFG-bOTPw@mail.gmail.com>

On Mon, Oct 14, 2024 at 09:48:16AM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 14, 2024 at 4:11 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > +     /*
> > > +      * This is called from atomic context (with a spinlock taken by the
> > > +      * atomic notifier chain). Any sleeping calls must be done outside of
> > > +      * this function in process context of the dedicated workqueue.
> > > +      *
> > > +      * Let's gather as much info as possible from the descriptor and
> > > +      * postpone just the call to pinctrl_gpio_can_use_line() until the work
> > > +      * is executed.
> > > +      */
> > > +
> >
> > Should be in patch 4?  You aren't otherwise changing that function here.
> >
>
> Until this patch, the comment isn't really true, so I figured it makes
> more sense here.
>

So the validity of the comment depends on how the function is being called?
Then perhaps you should reword it as well.

Cheers,
Kent.


