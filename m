Return-Path: <linux-gpio+bounces-23087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D5B003E5
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 15:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F20B17D7BD
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 13:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D56266EE7;
	Thu, 10 Jul 2025 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="IOXmIKMT";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="M3CIyWOX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E0925D8E8;
	Thu, 10 Jul 2025 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752154914; cv=none; b=Nc2EQ1AGPDJfSakGx78HdjqVtsOO+QyXLniGTUy9IZI3J7RlctzbVl634qM9/6BJFi/O/eHWqoImWgo1ekMmduYKUZq67+fiLWQA4lUEQ037CHn1xKtJEhig0jMQjl8xfzo0NQhntDvUV21ydW+TAeTEiRGzKshbAQE3p+vHVRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752154914; c=relaxed/simple;
	bh=fiVg+72fLvemxCPHUpPGQOk+oG7zrpHnGkly3RQGnwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uO5DRVnuMmEY0mEgiO660OwPjqqQPhaAFQq1sGV9VLcBlNH2pGsxWA7LUj1Zb59wy28HYzWzkcJBUuzAzd+/9R3RziscMm7P4cgZZvDcFW3xQaqnsEeNLfhmlhCb04HYKaU0yQlYq/hNX7dcqawg87P6rc3m7EVpM31jJjLKvdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=IOXmIKMT; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=M3CIyWOX reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1752154911; x=1783690911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cgY4ObICxti90QDKA4AoLGPXipEYMCZjHk4tIC3LNhk=;
  b=IOXmIKMTKAkqUqmzJSBFU7pFTpvfMpgqknutDcrOrn/NyHCStYqfeMne
   zDrkHTWCYThm+2cfFdC3/HzMgIB+Xov24FROrScKyCZLC1pvd9e50xRb2
   SBF5+4OhCoE/5zSw+v1JV+GrEs2Bh4zKWf6vPlfBtbcLoarX3fC0uy7zJ
   wuWXVSk+0lDRriHD7+jF5MtmNR9tKiALEN85+6YIuC21KbX3r8MbBHFDI
   j6KtuEPyuHEt5dCMgL04CKrAhqxtOhaBaWyZW0Uu80Bh29FCXKgUzab38
   HF9kTmRNMpb5e4ahPm3IMx0X8MxtiG8oiRPI+adfCFgINWdkQc2yhQwiX
   w==;
X-CSE-ConnectionGUID: 6/prk9DBRbmbxhA9ebIkHQ==
X-CSE-MsgGUID: pgb9Z9voTxiPD2qLrJAQ4g==
X-IronPort-AV: E=Sophos;i="6.16,300,1744063200"; 
   d="scan'208";a="45140033"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Jul 2025 15:41:47 +0200
X-CheckPoint: {686FC31B-1B-A38CADE4-FD2ABC4A}
X-MAIL-CPID: 46A584DB90C25432DE46F580D8592692_3
X-Control-Analysis: str=0001.0A00639F.686FC331.0024,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 001E21687B0;
	Thu, 10 Jul 2025 15:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1752154903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgY4ObICxti90QDKA4AoLGPXipEYMCZjHk4tIC3LNhk=;
	b=M3CIyWOXs/7KwOqxN/gMCPuCtMa7MZTdLjOvZx32RZ1AQObLLfeqiP6kSmu0OAnLIggIUS
	EMnbHD4eT5x8okAOpF4DnmtDARLo2K28fPDXwomumVLnT9scXlziFUCdcN6RCJMjhA+ITl
	9eP5NqSITSOD+Gk3z/WSXDrDJ/aJYSVngzfoUPFFZPIFmn1UttjRiLgaL7o50x+dvf1XSm
	4feHJocqOFoCuPwhA4DY5Eo+nbKRrIXVJbzlPRYiQyQy5vBpXPSpTBzUvkYSFLQ+W4dqAU
	ZkQ2ct823GlpW/73r/NbMLeY8fdIOJnlbRMRcN5yeF1DQ2Ig7Ww2BCGlqvWdeQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject:
 Re: [PATCH v2 2/3] ASoC: codec: tlv320aic32x4: Sort headers alphabetically
Date: Thu, 10 Jul 2025 15:41:41 +0200
Message-ID: <8598872.NyiUUSuA9g@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250710-asoc-gpio-1-v2-2-2233b272a1a6@nxp.com>
References:
 <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
 <20250710-asoc-gpio-1-v2-2-2233b272a1a6@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

thanks for the update.

Am Donnerstag, 10. Juli 2025, 14:40:02 CEST schrieb Peng Fan:
> Sort headers alphabetically to easily insert new ones
> and drop unused ones.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  sound/soc/codecs/tlv320aic32x4.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320ai=
c32x4.c
> index 7dbcf7f7130b04a27f58f20beb83eb3676c79c3d..2f4147387c4f802bdac983c81=
b104c000b1fd6ed 100644
> --- a/sound/soc/codecs/tlv320aic32x4.c
> +++ b/sound/soc/codecs/tlv320aic32x4.c
> @@ -9,27 +9,27 @@
>   * Based on sound/soc/codecs/wm8974 and TI driver for kernel 2.6.27.
>   */
> =20
> -#include <linux/module.h>
> -#include <linux/moduleparam.h>
> -#include <linux/init.h>
> -#include <linux/delay.h>
> -#include <linux/pm.h>
> -#include <linux/gpio.h>
> -#include <linux/of_gpio.h>
>  #include <linux/cdev.h>
> -#include <linux/slab.h>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
>  #include <linux/of_clk.h>
> +#include <linux/of_gpio.h>
> +#include <linux/pm.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> =20
> -#include <sound/tlv320aic32x4.h>
>  #include <sound/core.h>
> +#include <sound/initval.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
> -#include <sound/initval.h>
>  #include <sound/tlv.h>
> +#include <sound/tlv320aic32x4.h>
> =20
>  #include "tlv320aic32x4.h"
> =20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



