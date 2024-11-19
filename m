Return-Path: <linux-gpio+bounces-13102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA09D2732
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 14:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6EE01F228D6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 13:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7044C1CC156;
	Tue, 19 Nov 2024 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U01sDPt+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EF91C57B2
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732023863; cv=none; b=nkjRssCi4k8SNW7K2mDeq4s9/YBniYXvLzeY7cbNmElzaI2sLb7OGBuQstwANsbFZrie8HnIQuMnbIJrvu/62NVrPEqWKhf6UbzqloS6SloF172tA8Bn5ODYfAz9+4GRvVIkgYeUBaBsE5wNra97q9hPIqFF1+DjMGeOcgWA4lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732023863; c=relaxed/simple;
	bh=9dfyKpZTpclCgXT+A2wuv4nmavswI07n4V++9Z4sM2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4CXQ2BeitoGQ+wbY5osONLDjhounNJJyHnkMPH0FwB6kf4mu4nSyrMTNu6SupgFmtc95xQg+aCYz9apOUvULYwy0dOO/prQwpapL8+JrtEaaX9+Y5FQR1/uXja9kQy36VhC8kFI2aTisj9YEVUHfWzPJ2cVWfDDnzTroMgBTm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U01sDPt+; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85700f9cdd6so1153758241.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732023860; x=1732628660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dfyKpZTpclCgXT+A2wuv4nmavswI07n4V++9Z4sM2Y=;
        b=U01sDPt+FCsW0xct4fjBy+WeS/JXGS0hR1ocLtHgHSipMG5ePmw2i1vD8oXN3B0p/3
         YLsIlIraoY0x0khk8PSvlx6s5bc1Xrtc5dp6GsMR4gNL+ipPtROftTCZfn0T61eLI1Qd
         q6F1n2cuDRmiULqf5iSyhoguf/yu/rEJxwQJK+0bxuR+wq2lobBfeU6ZBslmndt+8Qyf
         jxJC7M6voO3mNumH04eEtT0JvTTWVJK+ozpXYSQLQej3IOVrE/8+Dq6l9td3c6Qcz7us
         3HWJDCawzKYWFgHzh/LW+ulmimzA/X36RR890eWAereW7AmnnnhPltlZJU3HhxHAotjt
         KWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732023860; x=1732628660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dfyKpZTpclCgXT+A2wuv4nmavswI07n4V++9Z4sM2Y=;
        b=FGFFKVC7woaZ5ZHt2aJmLSRr4XjG0KOBy4UjcXCLVqzM/9LarEn2trCxLJebk2rqmt
         qqv5CAvYpj8WHI4FecEN/iREuLe0pFuoUW0ekuTZLiQQKTX1yBmB6g/miV3AQtk/a38D
         QDFzTYEBfTlrU5N3VcpdCKUDaP3x3SSv9im+Qpfd4YeHjN3ugz2qp1LI+D7zZvVBAGrt
         vd9CGYAYD03TksMZP3u2bBGt2j9p5K9sOXFecvcGQaHJL1I/ZxzPrI3TwKHPDHDnU0O+
         kaTiUFCFiMjYQVHWlfTkPpExcvbsE//LqBVzcwTNM+kwdy2JCAnh0lJIFYx96KR50DJH
         E44A==
X-Forwarded-Encrypted: i=1; AJvYcCVhl48JQDSKq4V5cyhwYj1S5u14cx0GlBjN7RGvvH9+PLS0VcezlKCfK6IDA+zXo5b9ptADkXFx4Fr/@vger.kernel.org
X-Gm-Message-State: AOJu0YwqP60EH8ILpBAE25luemQGyPaeUBEXudPRCl6pld09VcUHHULT
	M4ljbQfbujFsZekaYM7nJ8UwhuMgwms2Iy8zKwvIjUHzTUByVoFjHlBtE/DU7AKiJ76p4T57tu3
	yvA/X5ZVy/JCZOdOTU2fIVc4Jo7Y=
X-Google-Smtp-Source: AGHT+IGDN62N17CMBHvvnv68xqtTwtUEewqo5tbllKcgXHWlhj5203XfjSiSrF8LWNW/+oupVXejIpnxGL9hK2nLbFE=
X-Received: by 2002:a05:6102:32c4:b0:4a7:4900:4b39 with SMTP id
 ada2fe7eead31-4ad62b5ea08mr12860829137.4.1732023860397; Tue, 19 Nov 2024
 05:44:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114145116.2123714-1-vfazio@xes-inc.com> <20241114145116.2123714-19-vfazio@xes-inc.com>
 <CAMRc=Mewh68d=2DmfDhMzWK6tPBFoqVLmdHqRWa9iNAzGjbTow@mail.gmail.com>
In-Reply-To: <CAMRc=Mewh68d=2DmfDhMzWK6tPBFoqVLmdHqRWa9iNAzGjbTow@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Tue, 19 Nov 2024 07:44:09 -0600
Message-ID: <CAOrEah5SpJRLKgzACncOWUTSsQ6sKuJM_K7y0605bKnGxOa8GA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 18/23] bindings: python: tests: add type
 stubs for external modules
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 7:42=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> This is missing the SPDX identifiers and makes `reuse lint` complain. :(
>

I knew I missed something :(

> However everything else looks awesome and I don't have other issues.
> Can I just use the same SPDX tags you used in other .pyi files in this
> series when applying?

Yes, please do.

