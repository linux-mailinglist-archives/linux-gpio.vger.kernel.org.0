Return-Path: <linux-gpio+bounces-1306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6EB80EA17
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 12:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 860D4281F69
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 11:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EB75CD31;
	Tue, 12 Dec 2023 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VnfxgSOb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D7B114
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 03:12:59 -0800 (PST)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7cb029c41e4so444090241.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 03:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702379578; x=1702984378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl9UwnHbb7lPTPFajSUVEEaKYhTHZ7gV//M4g1yBWss=;
        b=VnfxgSObFpNiuCJJ1CLm3ICwafGYSEA4di9qLc3jQlXIj8/XIf41+dIS3RPTQQYicx
         dUuBZRIri0+FZEQ6C1Ai0W5ONd2VvXpe509GAiX7/69PEH7KYYXPCFBJAjq/u1Q42yXK
         7HV2BY9/pdcZxSkZxaP9zgZYJ6aVZx+/fMf7KEx8sQo8GYWLGgdR7knCCTAfhKds9SGr
         BvIHp1QfQvHdlj/hLni73kPYYU/ygVVL0225JIDmdo+D4D8vIMuUVvt72plTHUWrYCb6
         MC2OgXPsNEHLToHgKINRGecZh3NCPMmB7jcHXZprCI5Wxt/E6WcibnDLEQHOTkirxLBT
         NMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702379578; x=1702984378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cl9UwnHbb7lPTPFajSUVEEaKYhTHZ7gV//M4g1yBWss=;
        b=cqM97WBjN0d/rTvOvTe/3WZEW83tG1+mjtZMXCnP/fxbMhv3/N1qzPFfuugSzoXL3d
         HzJFjfmlQ59IiAEEdWTdvxBC289Ml8Z3hj3fPPE9EqeIH5ZT1NAyshEd5qF4aimhyfY5
         aWy11xMXH9OMAw4zyH0a9eUpOX5KYhl7lA0CrbMOPWXqYJDUPaTz1UqdMlkT5kwT+Yal
         tJpgFOIXwAjvK8yGz/eCtFcYEbDL/kUgE4Pec5+sutqrkuePglimfDdeWeH0VBMers2v
         tCEYhjHCfj8rUrY8HXCj49ZBMIi6b0o3s0fwhKcn+KDd4M2oqP0fHY060/qqPp0eu/zV
         JlSA==
X-Gm-Message-State: AOJu0YyloQ6feG0mY5uyQxiFR9Fy0+WdjZSn0j7J2vd3p84gc3DtB9oO
	x6RfTdRqdJJMGbgFyVPpPrcZ91tTrZF/EdVuxQrZncg7afhLYmeY
X-Google-Smtp-Source: AGHT+IFVR/sNgz8StNLTayswDWwd3cqwgGj0WFItp06PhgPonoaPi0UMKNZEL60LKlTgtD1CduO6Jl04WlpbjDz3III=
X-Received: by 2002:a05:6102:5112:b0:465:d715:5ace with SMTP id
 bm18-20020a056102511200b00465d7155acemr3382753vsb.30.1702379578711; Tue, 12
 Dec 2023 03:12:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEydid=u3zTn-P-OW=58=bQOV7hVeyWbyPAnYqqQJSOnB_Z4vw@mail.gmail.com>
In-Reply-To: <CAEydid=u3zTn-P-OW=58=bQOV7hVeyWbyPAnYqqQJSOnB_Z4vw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Dec 2023 12:12:48 +0100
Message-ID: <CAMRc=Mf+O-irNhM8Fx=T1H7uFddYeXMECxB1qMm8-knuw6hH-Q@mail.gmail.com>
Subject: Re: [libgpiod] - fast writing while waiting for edge events
To: Mathias Dobler <mathias.dob@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 10:55=E2=80=AFAM Mathias Dobler <mathias.dob@gmail.=
com> wrote:
>
> Hello,
> From reading other conversations I've learned that it's not a good
> idea to have more than 1 thread accessing libgpiod objects. But this
> raises the question of how to react to events and let reads/writes
> through as quickly as possible at the same time. I have already played
> around with the file descriptor of the request object to interrupt the
> wait for edge events, but this solution is not good because it comes
> at the expense of responsiveness to events, and requires complicated
> synchronization.
> How bad would it be to have 1 thread waiting for events and 1 other
> thread reading/writing?
>
> Regards,
> Mathias
>

Are you bitbanging? It totally sounds like bitbanging. Have you
considered writing a kernel driver for whatever you're doing?

Bart

