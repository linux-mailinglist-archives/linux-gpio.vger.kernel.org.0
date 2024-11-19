Return-Path: <linux-gpio+bounces-13096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5459D226C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 10:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D086CB211B5
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 09:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C5A19CC14;
	Tue, 19 Nov 2024 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0TIquMQ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D409F198E77
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732008263; cv=none; b=AVTQGn8sRq9L8oBHVNNrVlPr5V7+nMHSFjrcYjMHas6j3tW4VqMfvg3uRsKtKMUkCB51B7gEXmfXe5ZdPM5vOSfsqX1IMOk7gHdqEOB+o3UtLblmTE1lljEjSP22/WnCPEfEwBh+62qUn5VFKzdcmsVZnXEX7O45Ynj4kC+iAdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732008263; c=relaxed/simple;
	bh=RQ2i0REVhsmDHVtmOMOUVxmLNSTHjDDHmDYSQhaXu0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I53deRp03NosPoVnZJKTUhWu6gIBuoyqJX1CPtv78BWgkiRriLgGax+EETb+GCj6rY5GRIjKGCw64BiAYkWBWunJdtKJKSG/bHWhlZEMZfHk/VwEARnIdGi+3ws/5EE54mNzIGSec17+56ir34i5wlhx6DDJS+B/boLmrnlF/9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0TIquMQ6; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so7342981fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 01:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732008260; x=1732613060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQ2i0REVhsmDHVtmOMOUVxmLNSTHjDDHmDYSQhaXu0Q=;
        b=0TIquMQ6ZHR+TOH0WiJ6Ywu/fPH3wpIGpHLIyqz82pQEaP5fszW65t3xZEdoxk3zrJ
         x3adBczeXFR9T/i6roUW/HmzUDntix8RYWhypkxM7uQXalqEOBpmRSq+tO4YIH1nW2CL
         pZzpvzRaQYqOHZ3Ug4iCCzqaNmmz+6IEBDY3AEXpIzgK1ZQpVBCvTwS/kDWsS6Wwv+Q3
         +bqgawy8JGn8PoPvIlay1JCYiYu6UF4JmtjCAbTNjTmF/kol+QrXe+GE6a2qxAaeL2xx
         LRt4VoFHL1j6WgJmyfIf/0pZOHm86AJTx+YXqubAZcjQB90v3yeti0h4kGa525yXAizP
         k7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732008260; x=1732613060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQ2i0REVhsmDHVtmOMOUVxmLNSTHjDDHmDYSQhaXu0Q=;
        b=jFAXIXjSh1gWHlHiMpLoTwZnF9PNiK0WeQHwmyf7Xk0qXhSKvuf7rVaKMAyu9pLQN2
         DT2ONVyJR9zmcqYztaWaETIBzUcfwsPJK517qoiCc6l92jHquf/hc1k7V/uYeZ5oMfER
         FciX8XPujIdnoDuc7+zuPMxi46vnzxdjIK/E/IxNQ6cgq+m8nnpSWpRhzYebnT/SstUp
         qgbgvFI1+ziJeqfcdwtEqy+wQCpsNJQZfWcxH40+GNwawnGeyy/CP+2hwnUMSRNDsKAY
         7FbuXLspcOZjA2p2P0vXKaKmAqFHTDQNtNvE2H5a/gv8bYSVJE5W8bLZrAnFRLo7Ve2X
         ocQg==
X-Gm-Message-State: AOJu0YyrWESSY12ow5eo+IfDSmg+Y4CHtCyStJht6UPvkhnmOHs68m2p
	u0/Sir2XEOG8oQ/tYshNizyFZ5+MdfKVj8YdKoFYKxf2P2B+Err3a3u8in2hDUjoX6PFwML2LpV
	YEJCzYK/oqhPSTbbO84SmElFXi6BrFsIbPCIKH99W5Com6NJz
X-Google-Smtp-Source: AGHT+IHHN8FGDRKYr7D/96ZQtDoNyOH5rgzdcKYv+2oPMHlcjfqO6vOnhSC84z2xEq7Hcnsjxw+Hs3RC6zfIyH2bb2A=
X-Received: by 2002:a2e:a906:0:b0:2f7:4c9d:7a83 with SMTP id
 38308e7fff4ca-2ff609c0985mr66520061fa.40.1732008259739; Tue, 19 Nov 2024
 01:24:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114145116.2123714-1-vfazio@xes-inc.com> <20241114145116.2123714-6-vfazio@xes-inc.com>
In-Reply-To: <20241114145116.2123714-6-vfazio@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Nov 2024 10:24:08 +0100
Message-ID: <CAMRc=McTBQtj7cx1F-LPmciGd97W7ZAhjZJ7c=0WUbcPdu3HJw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 05/23] bindings: python: add type stub for
 the _ext module
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 3:51=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Add a type stub for the compiled external module so that types and
> methods used from the module are accurately type checked.
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---

Nice, I honestly had no idea this was possible.

Bart

