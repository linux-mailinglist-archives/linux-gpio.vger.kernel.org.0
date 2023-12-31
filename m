Return-Path: <linux-gpio+bounces-1947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF0C820B1F
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 11:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB39828238F
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 10:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA5833CF;
	Sun, 31 Dec 2023 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkELJoVx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D033C7
	for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso5869713a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 02:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704019844; x=1704624644; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lzn94rSP1EGFx4rSItUbBx38hiVOkg2Ydl/yMi7QeKQ=;
        b=AkELJoVx3KepV/SUVDzABZHVM2tqCUV7cD/7eLzxIW/OFgtk2alAEr94/nR20A/Ckv
         atAtOFiDf9aZSfaODMTMllXc3S9Nuht0MBRxPPSoFF+QqhSMqTeFtxvIJgazDiJh84ni
         WYXIkhtzC3wn5DVcF/dROv0CqnRDpOUWin6hHglpHDLg+X/UaIEw+tQEkC/SXDEX2fX/
         lHYtkdbKNJCvgszQkHU0J1910D3GPIro5hA1w3hlo7ttZsNaIw4SWRTxFZZYM9B1E9Yn
         OOv8M54v6m/9HHF2kU9U7AMQ3u9MwkKU8ctaBsL2FTtFP6prS0Mn4dWIvuh9kLR2U5ZK
         4H/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704019844; x=1704624644;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lzn94rSP1EGFx4rSItUbBx38hiVOkg2Ydl/yMi7QeKQ=;
        b=rWkWFlW5K+PltTukO092xPrpUh0qoDtDQxnCS5PMsXhCm8fLp9oHt6GaYatWsQSi7C
         XIDvztulxK/651bI7+FDsQzICBZggxmXAkR3IytKDmdauISUc2ycp/3bhRH9kZBA9vmN
         Hl3oZ8dUbX1P9lb/798MYM/KdQQg9PB04gYAguEigugWJNJ9G+k3Zsqfzprpu8qZ4Ttd
         h7JW16AY5g7EyjeFqTG1sjZt4pgokJ911QaY1X4/SiBViZzD+jesJ8jKOB3qDHuanOGf
         EdHvwjISCuWMd9tq7PutlBQ2bZcPQCE0VprRrhqy/fgdcd/sjbo+5UjdxE0ltiOEYte7
         qzAA==
X-Gm-Message-State: AOJu0Yzv7z3WvwuzzVSNAsWdZisjFzMALMlBUT/pW+6D0iclXRLaHvlz
	ci2A8Maad5E+guQI9qFHes4=
X-Google-Smtp-Source: AGHT+IEMkv6GeRZ1u04BRP9+XGWR6fcAt0u3k00XiRb+DsjUct6wwO1fHFsfDH94EyPQiMb1LZWyNQ==
X-Received: by 2002:a05:6a20:431a:b0:196:efe0:c6b8 with SMTP id h26-20020a056a20431a00b00196efe0c6b8mr355196pzk.63.1704019843498;
        Sun, 31 Dec 2023 02:50:43 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id n38-20020a634d66000000b005897bfc2ed3sm17027690pgl.93.2023.12.31.02.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 02:50:43 -0800 (PST)
Date: Sun, 31 Dec 2023 18:50:39 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Documentation question
Message-ID: <20231231105039.GA53984@rigel>
References: <CAJ8C1XMpDFFTf6W_YW5EZM4Qok+=O9oOvGudUaxh8zQ-nE2iEg@mail.gmail.com>
 <20231231035114.GA15400@rigel>
 <CAJ8C1XM_+nhwNvxMh6xbMyLRexaRye9+Z5sTe6fLUte=uk1ufQ@mail.gmail.com>
 <CAJ8C1XMx=5PLLyBTP4-3A1dEQ9FZb6drd9dP4KJN=2T66hfYzw@mail.gmail.com>
 <20231231090226.GA45535@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231231090226.GA45535@rigel>

On Sun, Dec 31, 2023 at 05:02:26PM +0800, Kent Gibson wrote:
> On Sun, Dec 31, 2023 at 02:17:56AM -0600, Seamus de Mora wrote:
> > > On Sat, Dec 30, 2023 at 9:51 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Sat, Dec 30, 2023 at 08:04:40PM -0600, Seamus de Mora wrote:
> > > > > Hello,
> > > > >
> > > >
> > > > Cheers,
> > > > Kent.
> > > >
> > > > [1] https://docs.kernel.org/driver-api/pin-control.html
> > > > [2] https://docs.kernel.org/driver-api/pin-control.html#gpio-mode-pitfalls
> >
> > The pinctrl refs didn't have what I was looking for, but thanks & keep
> > your eyes peeled, please. I found something close (and a surprise) in
> > this item named 'Using GPIO Lines in Linux'[1]. The surprise was the
> > recommendation against using the ABI (libgpiod??) for "production
> > systems". Am I reading that correctly?
> >
>

Oh, and you are still wanting to clarify why the GPIO uAPI/libgpiod only
deals with the GPIO subsystem?
Not sure you will find anything that states that explicitly as it is
minimalist Unix philosophy - do one thing well.
So the GPIO uAPI only deals with the GPIO subsystem, and libgpiod only
deals with the GPIO uAPI.

If you want an over-arching library that deals with all the possible
functions of GPIO lines, like lgpio tries to, then you can always write
something that sits above libgpiod and the other subsystem interfaces,
though I'm not sure what advantage that would provide over treating with
each of them independently.

Cheers,
Kent.



