Return-Path: <linux-gpio+bounces-9838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C472A96D9DB
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 15:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E28991C21670
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 13:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F98C19B3FF;
	Thu,  5 Sep 2024 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hObqOW+a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1CE19923F
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541830; cv=none; b=WLfcf3Rxyode4vfAH7AeCkdWSU3fzwMpMgCfiG6P7qNeZxM8iLAnHpn5G1YBvk1WbeONarYs+9dteRufEASv6RowX7Qn8rVqXi+X9a0GoXcLGDY2QmavDUO9SQ+Lzohzd5AYoRlGJEvY9mJpipPPl6LYklCvppR/M/tC/X1Ftvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541830; c=relaxed/simple;
	bh=KXRFbC33Yl+pfZi2JId1/r6jjoV2ikMAyzhO8eOr3wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGUto6cCSGu/dGJsEFeLfVRb18vjFdfzfNuWZ/ebHD7iSdRWP78iPOLippGQRFU7wUeO77uJ3c224I8zr98xqfH2nRQH0HKesrCx4rLlfZZz+H2lqb5CLX9ZnfpwmmmeErv9otFKTE+XJaSFenGAH6eAOuoADAV2iRui7bLTRHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hObqOW+a; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5356bb55224so949759e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725541826; x=1726146626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXRFbC33Yl+pfZi2JId1/r6jjoV2ikMAyzhO8eOr3wI=;
        b=hObqOW+aVjs+j0z0r/gLVaH/IEkv1QTXoLmSML65rBR+PKHFrckSp5NzZIzuaGMT2p
         +t7a/+ec248qHmZBos4QZaxU7U99LniOwPRLs5WAM1lb5KDhOG+RyxsNmHVCmYdm9F9Z
         +y8L5DZrb8TPd05GJVpcHn97bnFQqd4Rp0yAYb1jKnpj2z/1ZAR9bYCItqfv+DfFVcB2
         Q+8ixDGQRit73tBNcxNALIeSn1x5/vJrHAKBX9VjMlLEuzSXMOr7Wij58e2cpKUL94M+
         n8BsAU3asLuvOBAJbDk8b8Lg1jxNABPYd04Csh1mcuTmdabFjdmg6D71AL2BBQOBtnnU
         IJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541826; x=1726146626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXRFbC33Yl+pfZi2JId1/r6jjoV2ikMAyzhO8eOr3wI=;
        b=OOcWiBn3HzD3uNGlSaRVLOXLwZjIxZkcqMsYl9tZWG9l6sWtb8fd2My+Sfa7yIpfgC
         KAu5/G+bN2NVEOy/LOGV5Nn0/uZmKhOPc/JQZD3Vx3BSNKL8wATOX9rgR3zRPp/5zrtI
         Wxfgb6v04nBPdtCY78IA9W4MlI5tglheIDwpJ8PrLxZsW+MMCmhPqzmn/mPMV1HbdNZk
         QDMd4gWOhhqKkEoNpW94tw4Q7VC34SUtbBYPRd4K+5x90BqR7g86a9xDpbPWrQWzyhRP
         QZz3Jn9WC7++2B3Izk3i+8Qvv3Dq/DyktSAH0o30cFEr+IKuPmFDH2bxGgI+79Z9Pw2U
         2BCg==
X-Gm-Message-State: AOJu0Ywv5igiNWmTXGxIL2uNw/dF7AnM2GoO+fhuIHraKpmPb1lWrN0R
	6LtImN8kIiDZ+iPl0+s6Hz1DrM9WKh2s6/ANm4an5+dW4s6oZV/ei2yOLjmDWhfgGGnMI0aXNjb
	UJPHcFlqiYFGci7MD81P2rikI5R9Qm2Flqy6DAg==
X-Google-Smtp-Source: AGHT+IGIOw4ETmWg5x6yruvx+G6MG0JTvkQpex3Lp4rnJeBa1T/G66UGjuZZXTOiVUYxsm9iCoOBP/bNLF6RPFc7ssU=
X-Received: by 2002:a05:6512:31cb:b0:52f:df:db40 with SMTP id
 2adb3069b0e04-53546bc749bmr13121570e87.56.1725541826007; Thu, 05 Sep 2024
 06:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903143812.2005071-1-lizetao1@huawei.com>
In-Reply-To: <20240903143812.2005071-1-lizetao1@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 15:10:14 +0200
Message-ID: <CACRpkdaBgwiL=_78D=jALfzxbE_XPD+ooVXLnykvvd2vLvpktw@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: Remove redundant null pointer checks in pinctrl_remove_device_debugfs()
To: Li Zetao <lizetao1@huawei.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 4:29=E2=80=AFPM Li Zetao <lizetao1@huawei.com> wrote=
:

> Since the debugfs_create_dir() never returns a null pointer, checking
> the return value for a null pointer is redundant, and using IS_ERR is
> safe enough.
>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Patch applied!

Yours,
Linus Walleij

