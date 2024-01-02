Return-Path: <linux-gpio+bounces-1957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 331A9821D6D
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 15:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C29E02838A6
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 14:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9DC1078D;
	Tue,  2 Jan 2024 14:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uij4ipDm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAAC101D5
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jan 2024 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7ccf60f3600so1775774241.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2024 06:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704204592; x=1704809392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJedsGZeT4ZWibqXYFJg3UnqI1x38OlbgGSH9LgR9cI=;
        b=uij4ipDmBgrNuU9Nk3MUKLzeok2WDb3KrzAUGYcsG1q2CEsMivFeW5onN5qBwhUHX8
         qwMOaQkhSrf1KUQltj+Iu1rAoDuHbGlGGr9Gt8ah1brA2gSkMWbTc3J7mz0Wzl2I0cRJ
         nfz97I+BuvxUP/4oIx8qSrNzZPAzj055xDUOUGJjeL5gi7oQGTpSvrMTcoMmpctA8hpU
         CqaYkufUYC850/wtoI08aGOFUniSKhfR7v+cE6+6/LKWQCAjQB+lwX1JRz1AELSnMqe0
         QIN6OT8tcxECMRBniJa6fOIiROf0NMhRAwY30ERIdrqD6fJ7Tam1pQbsoCDkC1yvddK5
         Gp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704204592; x=1704809392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJedsGZeT4ZWibqXYFJg3UnqI1x38OlbgGSH9LgR9cI=;
        b=XOpvuyeKIGMQxIJ+V7IgQjgtYqIdMk8goN+DX/wsxRAbPdtK/ZvDZsoadY9nxDf9AZ
         /ZRS7EqYZ6xh+7In0xuCuERF50In2xznjaDN3vAh9DDC2MZS6Y5W+c6/YNN3g6/AMzkJ
         QE4K9hOvim1VlI1xyx7CO22577or1Bg1pqrT/zcaNMuCR8N+KD+TRHSxXYQgLjTlbMJn
         SSCKXT0fVQSROiPQDX+tdqQRlOxe4acZWZ4084a+kBX7qGG2x6VtCIP+MeJn7c3bNb5v
         7ocxCur0T7891GEOrMIXGl/GhcRR/fqFj/VU9mcaJyiLMUYHlpzDEjao6QAA9VT+I65r
         bBlA==
X-Gm-Message-State: AOJu0YwlT7bB5ZJHDiZSgf66Xueo6bEcwowqQvHHjwWMu/AaXQC1bMou
	ZUSQoEVxtySDpoFGzbRTNenKcFx9gcjU89v+NDI14v4+kSowvyviHdNl73cf
X-Google-Smtp-Source: AGHT+IFNZK2+FvnrXm65Remw3ivMrWjANNM4VfeK2PFKx2OgQfjT3mHFCmZ9+F6grbd6NCMbgy78NeS76LmLet9Gkxs=
X-Received: by 2002:a05:6122:181d:b0:4b7:9dc:9ab with SMTP id
 ay29-20020a056122181d00b004b709dc09abmr5535119vkb.16.1704204591795; Tue, 02
 Jan 2024 06:09:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231230023413.23473-1-warthog618@gmail.com>
In-Reply-To: <20231230023413.23473-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Jan 2024 15:09:41 +0100
Message-ID: <CAMRc=McsddsXVxkxn3WvjeGHkunOnw3yN6x2ZkALTvxrRaWYMg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] README: fix typo
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 30, 2023 at 3:34=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> Fix typo in --enable-gpioset-interactive in TOOLS section.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/README b/README
> index 962dc06..69128dc 100644
> --- a/README
> +++ b/README
> @@ -134,7 +134,7 @@ Examples:
>      # Blink an LED on GPIO22 at 1Hz with a 20% duty cycle
>      $ gpioset -t200ms,800ms GPIO22=3D1
>
> -    # Set some lines interactively (requires --enable-gpioset-interative=
)
> +    # Set some lines interactively (requires --enable-gpioset-interactiv=
e)
>      $ gpioset --interactive --unquoted GPIO23=3Dinactive GPIO24=3Dactive
>      gpioset> get
>      GPIO23=3Dinactive GPIO24=3Dactive
> --
> 2.39.2
>

Applied, thanks!

Bart

