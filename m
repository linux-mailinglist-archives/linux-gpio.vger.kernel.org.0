Return-Path: <linux-gpio+bounces-24519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C972BB2BAA6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 09:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1183B63A2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 07:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DCD233D7B;
	Tue, 19 Aug 2025 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0NaHGUm+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BD4zrxKo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0NaHGUm+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BD4zrxKo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BCE204C1A
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 07:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755588311; cv=none; b=WZDRQCDMQUWUMQHpMA2ZQ6NIZ7dzktVG4LQOQ0QMahCq0bYfShOeI+EVwIifkLiBXH3jabvejqnGDNYg4EbC2tP8KRHx3FGLEEgEF2alMKJAzIhLsVctSsujhEUD9AU4q1Q+SGzHHdu7XpXVrKHVjKafWry8E+cAFfoXoRdYNT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755588311; c=relaxed/simple;
	bh=lbxwgBR9pXBSWE1is/mCGz62LtoDCDU/FlWuZl1Sr2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=q0grfvxX6G2turBxsI5Rvni3ZsNawB725k9q5cH7yHqV7J6EADabOyLIaUtxfLEuHpWsaTOX2B3Zn8c7vewQWUpZxxSQkRRTt0uvJuyEq19B9YS5N9Kv2IhnoOpSMshV/mMS8lh17Lrcoeh/3L/r3E+nzJF76yE/FBWQfkY7AgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0NaHGUm+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BD4zrxKo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0NaHGUm+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BD4zrxKo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0EDB2124E;
	Tue, 19 Aug 2025 07:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755588307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQIx6z7xh3Yq0HiZOhdiTPsATX7x+0559MUoedCSqqI=;
	b=0NaHGUm+oxjnwt/66qrSimxzYJ74uTFlseVYKCnDGsq6Q0e8gyBf/aEt/9bVPYiHD8+J1v
	HYCBGiTXpGwTOrdtfr7kG67dNLdOwQy0NHSbnZNBnD/JkhP5QZGZO+yBoZrOkpORBAiVTT
	/ya3cIuAlzqQrmZ+VwX5dV9QtSaxS8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755588307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQIx6z7xh3Yq0HiZOhdiTPsATX7x+0559MUoedCSqqI=;
	b=BD4zrxKozufVijkbzGxxx8nFStT+BAz/NNIP5KaRrwlyOLHHskEQlPfWLqKAfZ/iF2cF88
	adphDBPj8x2QMzCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755588307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQIx6z7xh3Yq0HiZOhdiTPsATX7x+0559MUoedCSqqI=;
	b=0NaHGUm+oxjnwt/66qrSimxzYJ74uTFlseVYKCnDGsq6Q0e8gyBf/aEt/9bVPYiHD8+J1v
	HYCBGiTXpGwTOrdtfr7kG67dNLdOwQy0NHSbnZNBnD/JkhP5QZGZO+yBoZrOkpORBAiVTT
	/ya3cIuAlzqQrmZ+VwX5dV9QtSaxS8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755588307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQIx6z7xh3Yq0HiZOhdiTPsATX7x+0559MUoedCSqqI=;
	b=BD4zrxKozufVijkbzGxxx8nFStT+BAz/NNIP5KaRrwlyOLHHskEQlPfWLqKAfZ/iF2cF88
	adphDBPj8x2QMzCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0147F13686;
	Tue, 19 Aug 2025 07:25:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ph36ONImpGiaIAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 19 Aug 2025 07:25:06 +0000
Message-ID: <570088fa-2861-487a-a2db-2d1d87d700f6@suse.de>
Date: Tue, 19 Aug 2025 10:25:02 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: defconfig: Enable BCM2712 on-chip pin
 controller driver
To: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <04c67a8fc50f2688fd3a6616bc03b3ac4d4977fb.1754922935.git.andrea.porta@suse.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <04c67a8fc50f2688fd3a6616bc03b3ac4d4977fb.1754922935.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[suse.com,linaro.org,kernel.org,broadcom.com,gmx.net,vger.kernel.org,lists.infradead.org,arm.com,suse.de,raspberrypi.com];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Hi Andrea,

On 8/11/25 5:46 PM, Andrea della Porta wrote:
> Select the on-chip pin controller driver for BCM2712 SoC.
> 
> On RapsberryPi 5 devices it is primarily needed to operate the
> bluetooth and WiFi devices, to configure the uSD interface
> and the power button.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 58f87d09366c..fafcd7851eb2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -592,6 +592,7 @@ CONFIG_SPI_TEGRA114=m
>  CONFIG_SPI_SPIDEV=m
>  CONFIG_SPMI=y
>  CONFIG_SPMI_MTK_PMIF=m
> +CONFIG_PINCTRL_BRCMSTB=y

Have you tried as module and part of initramfs?

~Stan

