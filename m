Return-Path: <linux-gpio+bounces-1946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52374820AA6
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 10:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3AC5282433
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 09:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B9D1873;
	Sun, 31 Dec 2023 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2Pax+5L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C24184C
	for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-35fea35c432so57666325ab.0
        for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 01:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704013351; x=1704618151; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jz4uGxOra/0AcTUzWL+xxdBQIZKRRzycslEcSTyCdzk=;
        b=m2Pax+5L5WQViC/tg9gU5r60J56y+0wLBNpzn58Eqx4tRDqN4UGk4DuLKWKr/mGq2X
         NcwNVfq/a7PmpKhT2hchO8LEzNrwugiw1hQGb2tYSvdUVXK60NgPEeDJXqvI+ph2daUe
         caqm8f1OFpcXl7W7bBxzi6rseqPdb+B2oK9H1lj0Ukh94X8qpAOqXElEX3gX0grZvQWA
         EKRdbzi3+YxgAJYYimbkuhosezJfzzBqR9ogcGD1djyoddgh+d1Wi8zEghm3EQtiZNZD
         eqeh/9Qs1nemjree2BxL3jfpEPTDeydYAD0OqySrsW+U+1hU2CL0fiVU+UHh/2rrxAK0
         5Djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704013351; x=1704618151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz4uGxOra/0AcTUzWL+xxdBQIZKRRzycslEcSTyCdzk=;
        b=ULn5dlWrrXq8VrgOMN+TOaCOMe/sOpJ9bzekQ0x0qe74TD64FcJpkwOaCLSd62H6aG
         N2d62dRrV4khQ9AWYDcZIKS2m5xVtFxzH8fugPNEObsYwEfVnXrzXFMxRRr77PpWyFDc
         SDSMBoOlBHztszFAprV1tJ1nUoHtT4k3KebsFKtUy2I6BB3XZuoCJIVXv1MiCKoNgeDR
         nP4/qstTRKCxVBpahNteMNYsiQ9B96oK9c389r9XjyHuVs+UEMpzlV0omKC9OLKXVs+r
         tB+ER2AOy3Dk89SoWHBD810USe7qLllND1fXfG//7IypvC4rt3KEc29N0Z4fKPtIa2PP
         xsYg==
X-Gm-Message-State: AOJu0YzOL/On3yg50xa4/njIgbSEyo8eUW1+h4MdFAhaMXjpeScdGl3Z
	wb2QBIZ64qzUvMKNIUFvjlM=
X-Google-Smtp-Source: AGHT+IG6glh3vIVEYeJi4gulNj5tN6Z93J30SNgETr6ppWiUEj+PpryZCIdMCUSDjm0DS9BF2bA7Nw==
X-Received: by 2002:a05:6e02:17c5:b0:35f:e253:887a with SMTP id z5-20020a056e0217c500b0035fe253887amr19969774ilu.59.1704013351261;
        Sun, 31 Dec 2023 01:02:31 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id h6-20020a17090a2ec600b0028afdb88d08sm22401087pjs.23.2023.12.31.01.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 01:02:30 -0800 (PST)
Date: Sun, 31 Dec 2023 17:02:26 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Documentation question
Message-ID: <20231231090226.GA45535@rigel>
References: <CAJ8C1XMpDFFTf6W_YW5EZM4Qok+=O9oOvGudUaxh8zQ-nE2iEg@mail.gmail.com>
 <20231231035114.GA15400@rigel>
 <CAJ8C1XM_+nhwNvxMh6xbMyLRexaRye9+Z5sTe6fLUte=uk1ufQ@mail.gmail.com>
 <CAJ8C1XMx=5PLLyBTP4-3A1dEQ9FZb6drd9dP4KJN=2T66hfYzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XMx=5PLLyBTP4-3A1dEQ9FZb6drd9dP4KJN=2T66hfYzw@mail.gmail.com>

On Sun, Dec 31, 2023 at 02:17:56AM -0600, Seamus de Mora wrote:
> > On Sat, Dec 30, 2023 at 9:51 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Sat, Dec 30, 2023 at 08:04:40PM -0600, Seamus de Mora wrote:
> > > > Hello,
> > > >
> > >
> > > Cheers,
> > > Kent.
> > >
> > > [1] https://docs.kernel.org/driver-api/pin-control.html
> > > [2] https://docs.kernel.org/driver-api/pin-control.html#gpio-mode-pitfalls
>
> The pinctrl refs didn't have what I was looking for, but thanks & keep
> your eyes peeled, please. I found something close (and a surprise) in
> this item named 'Using GPIO Lines in Linux'[1]. The surprise was the
> recommendation against using the ABI (libgpiod??) for "production
> systems". Am I reading that correctly?
>

The userspace ABI mentioned is the GPIO uAPI, so what libgpiod uses.

It says "don't use it to cut corners", i.e. don't use it when you should
actually be writing a kernel driver for your use case.  If you were
never to use it under any circumstances then neither it nor libgpiod
would even exist.  But there is strong emphasis on not abusing it to
effectively try to write user-space kernel drivers.
Where the exact line is for a particular case is up for debate.

Cheers,
Kent.

> [1] https://www.kernel.org/doc/html/latest/driver-api/gpio/using-gpio.html

