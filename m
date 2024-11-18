Return-Path: <linux-gpio+bounces-13088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB029D1B3A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 23:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F24EB1F21DEE
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 22:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6868D1E8823;
	Mon, 18 Nov 2024 22:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zfTCElER"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE211A08BC
	for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 22:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731970310; cv=none; b=GsnjdhTpBUykXswYUdL3Omhl7waTVXcCtVsKEqAFVb2pirI0V3erENiBX7ZzUa6YyG6NgeGhP4RrLtzu3ErGK3VPkPWJt8FAhVFmKTuyk/jL/fpJpoLqnju85CxyBA3G4Xob17oUqKcbgS7w3ZhLJtSKaf3OpjbBzFB70QZqcsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731970310; c=relaxed/simple;
	bh=DV3aBIVZUW5hHs/V+Mey60lTa1s139TVg+4WoyTBssk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZTDdbjM9x4CnkQqhlREp3NVJHKeh249Bev4n0hTgvVqQ3eqxSo6l+xft7aMYDUfX1mpDYShNa3Y5rxofSLOY8f5j/hgliK6CVpsuKnS9an5BMef00rsrVWLH3rhoPeALq01/H9y53H2k6pzuMIXEsDczC6aYcDi++Pzg13XrLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zfTCElER; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ff57619835so42506471fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 14:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731970306; x=1732575106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f33F97b+PnpJRlX/x5cwj0kMNkbiVool2hmrJOLGnKI=;
        b=zfTCElERFMMXgXs/tNGDYk+2GUXdgio+yfsyTCzt9gPE71iTLiGRpfVLu1dzq6Jsvd
         jBJp16JhGjWMIQDsBCqZQmQxm5OyahZ061eC1GgBRFBMvpTIjco8ylGouBsaTzCWsMX9
         DILm8n+tv6J0HkdiHYqEK05U0XVj5H1ADLjGltx2FMcJGlGpeucizzWoMtpP0BsBrBUR
         cEnUCJ5fS/o0tR2WIOJ9jcw8XlG5qRHQgmjC22T9kpb8oe2j6rY1ZxnfsHp85VioUMqS
         6JGXJKF/JSwiqiwX0t2HuMxYvw+uOSK9UoN6LlYOhlzfdTG3OQNTgj9tWiUI67e4/7bZ
         5arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970306; x=1732575106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f33F97b+PnpJRlX/x5cwj0kMNkbiVool2hmrJOLGnKI=;
        b=LHJL2RByWLbvmjZJ+AsVkVzVi2PjR6EKvyU0MLgtZdKAkuSq4CNLENIIyPgSUsT9qC
         O7/upWN8YVYklHftDLFIH378S+7zobjO+YbjlDioOrRLVKxPd5jnlryeTPWwHnnvw0dx
         8O25w5kv3wSgw9NfcJkJNdv213FNnYaxl86J2ORumUoPzWgKj52JyQeaNFT4VI+tpAFA
         XdHrQ0UWMyopaYQ+gqTrzGTVwZNfcKXZIet3wTojIVWQPyGwzzuLojqiqgbVbTBKR5bL
         vWmKiVAUFCy4aeYMkNEoVozy71D/hnWSmo/7XBT7KBTeTkPOGJqgOMtIhPQBjIcRNahp
         Ugew==
X-Forwarded-Encrypted: i=1; AJvYcCUFC8dEAE3CIdJ9rWRM3ZhsWyjavFzy8vNsYXbKN8pgNjhUzExySmmrJ/OhWUoEBSwLMplb9Qgueau3@vger.kernel.org
X-Gm-Message-State: AOJu0YzWUaCw5icLEMQoSjeXmcdcYJNdeTOAIwl8sT2aA1kqStpnEaf/
	bEESWraPsHf2oUFRLvMtyyi2grExF+MYBPflKojDFAD4dyeG9hIpnsfhxaNKLPQcqL+GbNe5jRV
	rbcavmj9SYj0UPlQyVVu4k4o0VmLlgX8XjMPaLvO/Qia14cCc
X-Google-Smtp-Source: AGHT+IE+LvSb06JlRpJBvrLSVlQfASmL5cVYrbSxkjEHmvKeJ5/pEjU4kAEyRVZfdyZirCFmy1wVfiU16ORjy82esSE=
X-Received: by 2002:a2e:bc81:0:b0:2fb:4b0d:9070 with SMTP id
 38308e7fff4ca-2ff83ba13f4mr2979351fa.10.1731970306401; Mon, 18 Nov 2024
 14:51:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113071201.5440-1-zhangjiao2@cmss.chinamobile.com>
In-Reply-To: <20241113071201.5440-1-zhangjiao2@cmss.chinamobile.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Nov 2024 23:51:35 +0100
Message-ID: <CACRpkdauNYwqBhNuV5Z_ToyCzRwLyLPPMUSfoZa6in7J-y3B=A@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: k210: Undef K210_PC_DEFAULT
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: dlemoal@kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 8:12=E2=80=AFAM zhangjiao2
<zhangjiao2@cmss.chinamobile.com> wrote:

> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
>
> When the temporary macro K210_PC_DEFAULT is not needed anymore,
> use its name in the #undef statement instead of
> the incorrect "DEFAULT" name.
>
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driv=
er")
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
> v3->v4:
>         Modify commit info and add review tag.

v4 patch applied!

Yours,
Linus Walleij

