Return-Path: <linux-gpio+bounces-1948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7102820CDF
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 20:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 762381F21C76
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 19:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B7EB66B;
	Sun, 31 Dec 2023 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RE6fqv7Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0CB666
	for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 19:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cc9fa5e8e1so88325701fa.3
        for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 11:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704051609; x=1704656409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGJ0h/f2E2c/hcrs1ePkRF42giECMKQo7jsuqqZTIT0=;
        b=RE6fqv7Y8rhO2WUV3uvIHT+9hZKhL6Jpn/mrN34t9NPE/einlEBKWLkdujMBTemAsv
         1Z3+SXfIT6ArLxx0fDhQuQiNGS96i2K5/0A0PLGT6EnY2r4AXhEAEmbJMmFA7BAx0MzB
         /cAFECD8SJ1DVp0oZDzURXzUGZuBjFkShXF4WZS2V3Gt4F3BpDRupfsnve5dZCPrdpjf
         sZVqg4MrCDuMIC7ob4X7D8xyRyKw33ONCsgWS4WAWq7DlurLgJxmQx7gfEwmlTaRO8DZ
         GZUpdjg361aiZiNIqS/4sI0/neBeamGB+zBWgIA9YX6fP1CNDr2TESvfi/hWSQZ4QoLV
         Bo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704051609; x=1704656409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGJ0h/f2E2c/hcrs1ePkRF42giECMKQo7jsuqqZTIT0=;
        b=P19pfxD031buxPQ/YrZF0hAbBwleqYjGVcOPtUi4OM1yj6aPQs+1MONJDkhKRialcZ
         E1Py1Eedsx/XbhE6CBwMO0/fBaY16X738KU/fK7qMHW4BstUpMq2VcgBK1onEACy2+xh
         nM00DiefzAS9JnNZtGis/UQjz9VafyCd/Aic3pIwxPfApaXxFpP4T6rTMmdkVT3oIV6t
         nGEbWrt76xCHwVVYZBFdRJj4vElSxNvuSvpr+0MPUSZyduzhrumiAIIMFMtI3Ok0tasE
         u9zpyIhW1d2q/iRE/iVKAtgzCH/XRDiTbviVx4DzbfjaYZkgij+7ssfqaTX40nGutIR5
         MCBA==
X-Gm-Message-State: AOJu0YyAIQPRbD72KNqu6I+OWreiF4JygWTXvJbfEbBoil2KUcDxf686
	ae65eHW/N6LI208QvOQcsFriMwVb1S+Jj5W/Rhw=
X-Google-Smtp-Source: AGHT+IGrYABGADfGo1VyLhqxuU0Rf0f4wPWT1AYQw1KFW7VjaxSd+snjqp8PNBo9T6zEyx2C42zTcCn31rqszNZwogQ=
X-Received: by 2002:a05:651c:509:b0:2cc:dedb:ab9e with SMTP id
 o9-20020a05651c050900b002ccdedbab9emr3560248ljp.56.1704051609211; Sun, 31 Dec
 2023 11:40:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XMpDFFTf6W_YW5EZM4Qok+=O9oOvGudUaxh8zQ-nE2iEg@mail.gmail.com>
 <20231231035114.GA15400@rigel> <CAJ8C1XM_+nhwNvxMh6xbMyLRexaRye9+Z5sTe6fLUte=uk1ufQ@mail.gmail.com>
 <CAJ8C1XMx=5PLLyBTP4-3A1dEQ9FZb6drd9dP4KJN=2T66hfYzw@mail.gmail.com>
 <20231231090226.GA45535@rigel> <20231231105039.GA53984@rigel>
In-Reply-To: <20231231105039.GA53984@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Sun, 31 Dec 2023 13:39:32 -0600
Message-ID: <CAJ8C1XODdrTcskCYbjbJxLvVUmK9Xv1edt=k6Upd2-BaA8y=rg@mail.gmail.com>
Subject: Re: [libgpiod] Documentation question
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 4:50=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:

>
> Oh, and you are still wanting to clarify why the GPIO uAPI/libgpiod only
> deals with the GPIO subsystem?
> Not sure you will find anything that states that explicitly as it is
> minimalist Unix philosophy - do one thing well.
> So the GPIO uAPI only deals with the GPIO subsystem, and libgpiod only
> deals with the GPIO uAPI.

No - it was something I read. I want to find it again so I can use it
as a reference for something I'm writing.
But not to worry, I'll make do without it... and it's obvious once you
begin using the library :)

> If you want an over-arching library that deals with all the possible
> functions of GPIO lines, like lgpio tries to, then you can always write
> something that sits above libgpiod and the other subsystem interfaces,
> though I'm not sure what advantage that would provide over treating with
> each of them independently.

No, no - nothing like that...

