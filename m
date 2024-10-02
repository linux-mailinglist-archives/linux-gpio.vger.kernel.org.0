Return-Path: <linux-gpio+bounces-10715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BC598DB90
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD3F51F2214B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C561D0F45;
	Wed,  2 Oct 2024 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QU/YXkof"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7421D0F44
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879231; cv=none; b=PRTSPRbYJiCKhIYAF7qQitQBzVR82NzmHLtlNogWHXrIsPRI4mbcLOFAt/3opXmuZ0vnO8QwQiAn2KyZIM08IWjNtbpWlLC492mG/CuqR8OIorigKwT4PgtCQr0g05mnCV3jBH98iLKiOS86U6HWfMifFiFogs/NKfBg4YSz+OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879231; c=relaxed/simple;
	bh=mXpbdK7Sq0w2/rvqDMV4yBmzLIisStvdz6DZb3g+TPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ithwkx2WUne9MOJ3kAOpMQfKSGwVwts44OLYoi3ST6O1qLJ579d3wQL0n0yslCv6YWISMGbc92BSVeTjSSvinfB+pGFf2OdnhN9FwUby9SFsg04d/YVxs/PdaqfVxbEKyrHjlnOp+OQweJnLCwvUgSLvSdC7A+QjXb4ab779DAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QU/YXkof; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fabfc06de3so46470891fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 07:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727879228; x=1728484028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMQuC8eL5QcCXYaC5lzjaR01YW0PMzH7qpPYpr9RF+M=;
        b=QU/YXkofyp1hSnpe+RuybOHEiTv5wyYRFecPSDeNPnrW52mApLnqjvN11rg6Kd1Mfx
         /6NlbefgNS57jvsvB3E2hgPT2IaENFWXR/Rh7Gau2Nj9TE37yx2WzVGT+RSv2sJ74edF
         GywatXDYuTfcQC3ghG/csKB/Hq9LJqM3EEYU4mhAJwe7YDYUiW7KchEUCP7mUZz4F+wu
         nO/JkVPNR7vekxn76SEhXgcHcjPsmkRiA8/Psz7zKGbM8Xow8d96rwZV+btGcgO8Gohm
         WqRYDCtReb15yc/mGbKoZz1LbnG0Vs0msWHMtPyCm0zLE6LH6b7R5Mus1CfJ2EAmhoAS
         3WzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879228; x=1728484028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMQuC8eL5QcCXYaC5lzjaR01YW0PMzH7qpPYpr9RF+M=;
        b=Tfn+k5Ek7TwOpFTU3r2V8Why/DtWksAB+JUHlFT+Dt10OP7nfqwAI2d1M/kObjTN0U
         ckPAAeABQqiNruMi0rF1VR7xKGGWt0FVlUZAKPh+LQ0zGYc9a3eNzenU3VMSUW6kK256
         eHONUMapRsPnG4YqD+gucwsc0n3uEKpaOlgy8yV0z1F/DrS2qETOV39a8rmcteOilhav
         ed0vmXnZXuJ6/pZrHBkFFWrP7Gcu0iC5W/t6UDacvtH2Wy/WnYVFDKEz0tP6T74ialwN
         4I4eGPa67pnxFsTxkR6HJAmyCIRlDZnke4t8yCV6o85s/SmXCrb4S3UIypBly+NhDrJH
         FCgA==
X-Forwarded-Encrypted: i=1; AJvYcCWWe7Bk2WwVdVlm6mya9MWBMLf6E9dLUCIsfC2QyNxVcs4ToO6TihYOYNX2IN6Hne06E3SPkB8PzjpC@vger.kernel.org
X-Gm-Message-State: AOJu0YxPPb6JJZCZRlvXG+Nb0VYLETTAJWAcJBrviYBrxQrXq2n0nId4
	MmhnUFgqFdu4vnE4oVXtYEThJ+QugWWvPECcy5P4jXBXe9oSHzcG2RecVJ97CrOAXhqzN1V0sj4
	1B8LLnuN26NUTMyNH5LjTA6Q+NtZladAD
X-Google-Smtp-Source: AGHT+IE8qUOPkLOfKh5iV186CwCP2O4ajUyERQPCfMPnVnzucrFoCg/aLu/lkBR4cCrnFTNs6talv9ATZxZh06cXVe0=
X-Received: by 2002:a05:651c:b2a:b0:2fa:d345:18b9 with SMTP id
 38308e7fff4ca-2fae10b4157mr20508231fa.38.1727879227334; Wed, 02 Oct 2024
 07:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002-fix-imx-pc-v1-1-95f8b89400ee@linaro.org>
In-Reply-To: <20241002-fix-imx-pc-v1-1-95f8b89400ee@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 2 Oct 2024 11:26:55 -0300
Message-ID: <CAOMZO5AijM3jQ9q3xAcPfP=duar+oMbzJJ561LsxbKscmEUyDg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx1: Fix too generic defines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thanks for the fix.

On Wed, Oct 2, 2024 at 11:22=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> The "PC" define is colliding with the (apparently broadcased)
> define for "program counter" on Loongarch, so let's rename all
> these 2-letter defines so they don't collide with stuff.
>
> Fixes: a55222b7a132 pinctrl: freescale: enable use with COMPILE_TEST

Nit: the commit title should be enclosed by ("  "):

Fixes: a55222b7a132 ("pinctrl: freescale: enable use with COMPILE_TEST")

Reviewed-by: Fabio Estevam <festevam@gmail.com>

