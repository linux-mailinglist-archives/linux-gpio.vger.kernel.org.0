Return-Path: <linux-gpio+bounces-28537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE4C60A92
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 20:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6901C355B54
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 19:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C382630B502;
	Sat, 15 Nov 2025 19:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZb6VMkG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10684308F28
	for <linux-gpio@vger.kernel.org>; Sat, 15 Nov 2025 19:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763236541; cv=none; b=UFXCCl8v+/Mfg4GgNVBAp8pKWDGJkYhoJZuCKFqMSuVulaPFIJ/c20/I/4G3GdpLmaWI/kZZHL/szFNjruPiR/AIFYUuNnnn5xHJlxmiBXg9SuVZ7HrjdJanvUqc0+0U/nqp9eXGTrbNOhq7p/HvaH+QgMA1XtY7Narqc1g9DD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763236541; c=relaxed/simple;
	bh=C+/K7Q5NqN1QoGmW+YDQcSan94kflPiyGMVUObBT0xc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCgc1eA5ezYEe+tKZN0ZvUkJzvQF70YPMumKIlfIzD869rdCZGHFCOWQSuDC4O3FjDNGOP5doRNfIeS1mlO7E/hRmjs3V0njogVu9h/tMcTvOIfRoTGrFCQqW+RnwbqHuy0avnnvgSeydtZX8o/R79v0g5hqGz1Z31K8NNKH/Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZb6VMkG; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so2206849f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 15 Nov 2025 11:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763236538; x=1763841338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WuleB7Uof+tsaQSPA6fNwqHx1Lp/3ZhdyDUy1IclBq8=;
        b=dZb6VMkGDRhYOgQjKl+pvr8WuYt/c/uWS0bgOZkLt89XbyBVefy1bl/DINlm+/yYYo
         kQx/i44S335YdJxqnxSYE+h8ypf1Y40zeZak7FCx+OxdzVm37Zkva/nTk+u5Clmi4eLr
         SIe0KtN5ORMfsPvtgKrbZ6d8RipKeBohg291d4z8FqBr3Cu82H12mH7/7Qe0hjCUinrb
         tTUzUWiFxL2YROr31Tk+w/NyzAfOGRvlWl41+/JrXA4upLydl3q4BnacfQluES0YSM+n
         e9nGxvecmNg69/ZuMVgX0vCs8WAr4KQlxG/g71FcGqnob7TrJCcRePqFDTMHnW5TZA3W
         BzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763236538; x=1763841338;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuleB7Uof+tsaQSPA6fNwqHx1Lp/3ZhdyDUy1IclBq8=;
        b=WbMX17B/3Oh5t4zMRJ/oFuPl081Tx5Lt0b0Gui+4TAfe93p+wjHgjb7BzytJeOC5AH
         Au6EKXpXvFGtCAlkjCDcqmrmgyZUxJyYAuVjRUvcKmlVaK/ywK76BuOV5PlTIMv4mYyb
         7pydUtfbuio/BNg86p5IC9TauMVG6pQDbl+/rPC6J5F+Aetnn9gnQXF6ihOkqmRUpPeL
         AawzMrCkfYmZoRgCENNrHQyF3uWkkOUQnbrpmz48JDyfaYsE+UahL1edLZtlTGiyY94l
         2DC/F0cmT3oRd/69DoIV1btZ1eHiXJPDmW1NgTrGLWtGdbTbJqNJUl1Rtt2lGxjpazS2
         mZZg==
X-Forwarded-Encrypted: i=1; AJvYcCX9LhuRMgI9kJAaB2NbqklRocWgdjyRNzQT8I4w5LznXZYuvOQ3Pt8nmECiv7pkbnGsZ4nQdvcINyDx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz63L7MQa2PRBLrKkL3DP6REUX2+eKAyJDfgb3K2x9BJpE4A/2w
	suMidxk5P758oZm0L4wWDRYS9QCP2E5ow5hFOHX+2gsDMZrukg2SSYIt
X-Gm-Gg: ASbGnctfJmr7oamc+9136KzmioUw8KT49wIbYt8tBR3NOXOfpHRlfXBMOXtn2OM88UJ
	lylqxl1jhKqKragjWEd51DeA1X9SG1eL3gGfAq/A8OvGVX4ymXXQuL5Qb0a5HdMKz735rVBaQVI
	s65s9BRh+2C9kbMRCmqOZE4Q7QUkKSRbq5bVP+lz0yurbnGGmZ1ZfR6nIWkkXDlPC2uhaOyytLm
	/KeXlgqJQwz1mzuvzeK9nn0jcPW6z9kwFCMx1myqKSG9gmAIgSqr2IDgYYFpZbhJfTBr5U/o8P7
	4Ssj6BhHQJYyC6G5/RP9yyyVQDYVkaKFJhQ9ZUmQKvMIMvWfQYzPIOyxxUM4nv0Wa+6o22HCAlO
	pkiD9LUtEaKiNmt+sGv4zBoPp9uLuegD6sjtVmd/3u+4rguHdIHh0eX7fsONX/OY4H21nCvi9qR
	TIT7Zk9ddRnLxFsGrbvRhHfQduKtVHLTCUaFMDbrWQ13ddAFYl+R03Gs/6oFUUmtc=
X-Google-Smtp-Source: AGHT+IEf62GmYjxzwvkFlgA1Y2k3Lbqy6ScY6eZSdDpeSqLPl8AdyiMH5V2WcDmQSZsaAfQG8l5H1g==
X-Received: by 2002:a05:6000:1447:b0:42b:3a84:1ee6 with SMTP id ffacd0b85a97d-42b5934e2d7mr6759730f8f.24.1763236538325;
        Sat, 15 Nov 2025 11:55:38 -0800 (PST)
Received: from Ansuel-XPS. (host-87-10-15-59.retail.telecomitalia.it. [87.10.15.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e84a4fsm17126800f8f.11.2025.11.15.11.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 11:55:37 -0800 (PST)
Message-ID: <6918dab9.5d0a0220.170613.3fe2@mx.google.com>
X-Google-Original-Message-ID: <aRjatPM0eXV0N5XZ@Ansuel-XPS.>
Date: Sat, 15 Nov 2025 20:55:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] pinctrl: airoha: Fix AIROHA_PINCTRL_CONFS_DRIVE_E2 in
 an7583_pinctrl_match_data
References: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>

On Wed, Nov 12, 2025 at 11:44:30AM -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y / W=e):
> 
>   pinctrl/mediatek/pinctrl-airoha.c:2064:41: error: variable 'an7583_pinctrl_drive_e2_conf' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
>    2064 | static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
>         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Due to a typo, an7583_pinctrl_drive_e2_conf is only used within
> ARRAY_SIZE() (hence no instance of -Wunused-variable), which is
> evaluated at compile time, so it will not be needed in the final object
> file.
> 
> Fix the .confs assignment for AIROHA_PINCTRL_CONFS_DRIVE_E2 in
> an7583_pinctrl_match_data to clear up the warning.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2142
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Christian Marangi <ansuelsmth@gmail.com>

> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> index bfcedc7f920b..706532a820b0 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -2993,7 +2993,7 @@ static const struct airoha_pinctrl_match_data an7583_pinctrl_match_data = {
>  			.num_confs = ARRAY_SIZE(an7583_pinctrl_pulldown_conf),
>  		},
>  		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
> -			.confs = en7581_pinctrl_drive_e2_conf,
> +			.confs = an7583_pinctrl_drive_e2_conf,
>  			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e2_conf),
>  		},
>  		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
> 
> ---
> base-commit: 57916750bc0886917ea2c6209ca6a56acb7b8182
> change-id: 20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-bbf4cff20b50
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 

-- 
	Ansuel

