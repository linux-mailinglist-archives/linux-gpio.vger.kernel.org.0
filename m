Return-Path: <linux-gpio+bounces-1955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 238A5821D59
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 15:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFD9B28435C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 14:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA4610A38;
	Tue,  2 Jan 2024 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OdF7jU0F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CB612E7A
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jan 2024 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2048e63dbd9so2951793fac.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2024 06:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704204389; x=1704809189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzXe6US29YOHdVFRbkLSeHFGmCJisU6PuhTbUYcaHbo=;
        b=OdF7jU0FwL1pCX4Jjv8z3wh9IJGFM7tvZ+YwG+1MA4vbHHClynVRWVcir4NC0jxSEp
         1+AHAuYFjOQboTEMd3NHC1430XlhHt/dhhbXRJl+/YmGwA6PHEXo8lsnsSVuvDC9/Rhk
         utg8eca9aqabrRRPremogQ4Wv1unHj/9n5ackGvm/yOIsQhL00bQr17e123+7mg5kGaH
         +EakhPBUYB7Wl01mlhPDJ3kmuLR793br3Fc2pabFJe/Un2wXBN6C2rWZ8wAvCCVLN6ic
         PRbIjvZjTDIeobcGwRMfp7HtmsCNzDxCh3xQq4QcJDC9GI61f0REHQKB8hRElEWN9Ty5
         f2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704204389; x=1704809189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzXe6US29YOHdVFRbkLSeHFGmCJisU6PuhTbUYcaHbo=;
        b=MjNSGLA/EflJZdO/UvQ/EumuxSORoBk8z18K/e4ErBKPGD1krYPoVmQmmDlsM4kZkX
         H4H8hSyoobbjEc1I4rXkWMAjWfnW4YSLmEZVpAW8h9CgKETc0s5L+8bImMdM41f7ZQ9v
         ht3dM/Yroj7lv4c4UWbieqB3jcOgxD4sF8ubmQyt3YKmARQhjYk7ADInY6n+Bk/11ZpZ
         8X19Ih9lzD/JSqwRZfAJINsSYQz5cwf2eeRMhUMBHGAgK/XQxOZa7hjJomCAUlqzDD7g
         W4qIE4coHQFKG8rxE4xfMF03OElprdD3LDhFIzLVLkeYjvwbI9wrkFUXWTVkq9HFlIcs
         aBxw==
X-Gm-Message-State: AOJu0Yw/wyFvePGZ8tLoFH/aJW77EtRWcWyWnUg7CVTcvU6uY6nwCo/k
	P7sFLGIpTPc331LNZjeMrUtxncapKjFSsDU9DFpLJBpX003htw==
X-Google-Smtp-Source: AGHT+IEuuAk2tOOABzENjVEh2OcrmklprZc9zPN56VU96eNciyttQBi/+GCIGYV7vX34DkRaeDDSSr34nRfcIt3mD80=
X-Received: by 2002:a05:6870:84cb:b0:1ff:6527:350b with SMTP id
 l11-20020a05687084cb00b001ff6527350bmr12285060oak.78.1704204389608; Tue, 02
 Jan 2024 06:06:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228130837.102524-1-warthog618@gmail.com> <20231228152928.GA124845@rigel>
In-Reply-To: <20231228152928.GA124845@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Jan 2024 15:06:18 +0100
Message-ID: <CAMRc=MchB+m5zPBo8dnxeGWVqY11TQb7BVVh1b_qqYr_2UVnjw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] gpioset: reword note on post-exit behaviour
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 28, 2023 at 4:29=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Dec 28, 2023 at 09:08:37PM +0800, Kent Gibson wrote:
> > The note regarding the state of a line after gpioset exits is
> > confusing and unhelpful to the average reader, if not outright
> > incorrect.
> > A common mis-interpretation is that this behaviour is arbitrarily
> > chosen by spiteful implementors. The note also specifies that the line
> > reverts to default, but that is not always the case, or is at least
> > out of the control of gpioset or libgpiod.
> >
> > Reword the note to constrain the scope to that relevant to the
> > likely reader, and to emphasize that the behaviour is inherent
> > in the kernel GPIO interface, not in the gpioset implementation.
> >
>
> Could've sworn I added the [libgpiod] subject prefix, but clearly not.

No worries, applied.

Bart

