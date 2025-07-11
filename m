Return-Path: <linux-gpio+bounces-23175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B8B02373
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 210BA1C23574
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE36B2F2735;
	Fri, 11 Jul 2025 18:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CzjWWBqA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B357B1B4242
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 18:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752257836; cv=none; b=Fe1LXIf7lC1gUZ+6YlSK1d7e57YMVy73oLzNJyQRz5quUTRKuwJxIO8LOMEQFtb+cHAa565AybTiVI+damLoZnjsiFf1hhz9V1tvmh78A0r/CptLY8pndGuTvgi9xcdCtVk8XEhig4cQVvwHg1d7MOGKz7uedA8g0/jiWgrCGvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752257836; c=relaxed/simple;
	bh=QYvEVyisu7Z6GreZjW4tCms0hBLpxnPiggZ/J2R6LGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQ8KpvQNXQkyRJMWkNRh/yaV49+rIJAKu7GbFjIkR/zKoE/Oo02KAejsiurGWU6x1ekWfSSLdMgm346k/iRMFnpCXLfRZDGkzWRefQYl3uksZGRlsENXNS3XTQgvLnirOsyKNKZsTZKKkwjEwqUFPGr/CUtdhm917/JrdOEAjJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CzjWWBqA; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so30193051fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752257833; x=1752862633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Y+y1NjMQjnO8BX6d3MKapk59N+eGmMqtyYDPUlr7Xc=;
        b=CzjWWBqAWUrc42ZpPtNzTft+4+5MsESaOZwkhQrLtRgcDWIVgA3golo//CvNKAYlqA
         LitC8c6rSn1OL2MqSVRkdU8cNwI6IO6r3N2bVKMsJ+rKzjVpz3u0yjKAjBX+S0DXJTre
         SEIio+GbBVjyVNi8RM9+uQVdJDcg7hzCBpUGtnwgFeIgLUNXn775aI2z1RuxGhATzc0+
         BIPEWfMNA+0EtHK3VjWor2fWSKYg93R1j1BdM4BfnTEZxkrbZPgssjo4jhiZOx35L6R2
         /vHGEKDEYoJiQjBnbr96OwMcfHD58nDacz2N7TsoMUQUfJH4yl2XNFq82sjVf6EAogal
         Xx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257833; x=1752862633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y+y1NjMQjnO8BX6d3MKapk59N+eGmMqtyYDPUlr7Xc=;
        b=Pt79FvebzTQX1uNs+I9ri+Dbzxu1M+g6JmPeFOW7cJBLfN97V+JXjn+pvjSwV/w5fD
         ldPh07zs4+q385lHT2pwTp5VGrkAaMhhZwhL0UerUgMA+wFxxo3hi5I6uPxoJhVOsyr2
         gDhGKPhFRHI+j6X4KvkkWm9BDfPCDFYOSIQSALP2RTnilCUKGHzIm4PO7WZ+6Hsm1ogR
         ILO+YURmVuAs9e0GTj2KnTMLm27j/UhyCD+RAPiPN+B29ySD4vNOZxnNO+D18fvYacr2
         l5LLa/d6vsPPEuk9ln1pQab7oxI22z4kBM3d6zt3f0hapjaK0e61RojSMzoI9uggV4tP
         qn0A==
X-Forwarded-Encrypted: i=1; AJvYcCWXIZQRx5X5J5+VCn0eNtverCFtaQxIUb2v8CkVCXjTcfh40rSA+VpORJ5wTQEbZgB6GGDk1CxwalNp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1IU2dvldT96awq5su5uCVmNRNfSe1c4t0DfmTyzaV8d0GAQkh
	c4rim9crlCO3KTFTPSJIDNfc1TLXCHLZAtP5Rn0KQh+P6ryvmJSGb2Rq3T6vKn7rz066+ZppUYI
	iNzKsJOpL3O4LVREbBWsmso//vHiasQ/xtfLSQygvJQ==
X-Gm-Gg: ASbGncuOfDz6Buq7JD6zKgfdcxJTa4u0f48A7A+ylp3CTFjQHmaPbJodYHRqsw7a3S6
	Ctsyy2ax3ixpyHviE4tOajwh68ZLm7z95EOS94BHxEBZBXWlMrReHTjIb6NUlDY9ku1fmFRvWEF
	Qsy/+y5ibQEJD+vAidkdYf9pRgORR6/RtAhqpJDDwyh6VQyJBpX2ROoUSOPviGQ1paX9XQu78Lf
	blLtUk=
X-Google-Smtp-Source: AGHT+IFTXdPK5ouoC7CNop7rcdpVbgm/PLpNuMA/4LUKjGc3j/t/RJTnxOeKBYlPmUQiKz1UBrh6piJAWvjJQb85Qjg=
X-Received: by 2002:a2e:9dd7:0:b0:32a:6cab:fd75 with SMTP id
 38308e7fff4ca-3305225fddemr10781141fa.11.1752257832712; Fri, 11 Jul 2025
 11:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708-pinmux-race-fix-v2-1-8ae9e8a0d1a1@oss.qualcomm.com>
In-Reply-To: <20250708-pinmux-race-fix-v2-1-8ae9e8a0d1a1@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:17:01 +0200
X-Gm-Features: Ac12FXyhRoIM2kVVfeKGSARAFkZflXxQbi1Sz62x4a5cymVKfg1ewyjnPOhC1Kk
Message-ID: <CACRpkdY-4qHvYYDC39Z5K1mUkeMvpy0b4S-az673OdqxE6uPtQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinmux: fix race causing mux_owner NULL with active mux_usecount
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 9:59=E2=80=AFAM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:

> commit 5a3e85c3c397 ("pinmux: Use sequential access to access
> desc->pinmux data") tried to address the issue when two client of the
> same gpio calls pinctrl_select_state() for the same functionality, was
> resulting in NULL pointer issue while accessing desc->mux_owner.
> However, issue was not completely fixed due to the way it was handled
> and it can still result in the same NULL pointer.
>
> The issue occurs due to the following interleaving:
>
>      cpu0 (process A)                   cpu1 (process B)
>
>       pin_request() {                   pin_free() {
>
>                                          mutex_lock()
>                                          desc->mux_usecount--; //becomes =
0
>                                          ..
>                                          mutex_unlock()
>
>   mutex_lock(desc->mux)
>   desc->mux_usecount++; // becomes 1
>   desc->mux_owner =3D owner;
>   mutex_unlock(desc->mux)
>
>                                          mutex_lock(desc->mux)
>                                          desc->mux_owner =3D NULL;
>                                          mutex_unlock(desc->mux)
>
> This sequence leads to a state where the pin appears to be in use
> (`mux_usecount =3D=3D 1`) but has no owner (`mux_owner =3D=3D NULL`), whi=
ch can
> cause NULL pointer on next pin_request on the same pin.
>
> Ensure that updates to mux_usecount and mux_owner are performed
> atomically under the same lock. Only clear mux_owner when mux_usecount
> reaches zero and no new owner has been assigned.
>
> Fixes: 5a3e85c3c397 ("pinmux: Use sequential access to access desc->pinmu=
x data")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Thanks Mukesh, patch applied!

Yours,
Linus Walleij

