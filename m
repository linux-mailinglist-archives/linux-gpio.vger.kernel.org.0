Return-Path: <linux-gpio+bounces-37806-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I0PKOShHmquDAAAu9opvQ
	(envelope-from <linux-gpio+bounces-37806-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 11:27:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B9662B7C5
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 11:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9879E3011A4F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 09:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F063C9EE6;
	Tue,  2 Jun 2026 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOZeYgcx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5343B8BCC
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392410; cv=none; b=QsJcuKAi8mhwWlRAFW5rYlUJRY7qwg2wk8IAK0wUNuHyVXzuOkXigmUELVqxltDQ054gNFMnLl3YVjVUeRjty7pdxuXFmbziyrpfImLWgH4TuAIsjARYpDVJ/g549My8bO007SLcRHDblEWDpplHlcXLyVBfpmIbr8gcSSs1wlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392410; c=relaxed/simple;
	bh=UVCp6ynN/3KMjR+ySfgt5V2WPDJAnR6Bevewc+4Bwwk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=OnfvivWK5pKKwSJGMqB4GFhsPSK2lGOw6Q/f8G1jjBU1JoMTZj2vdR6MQyTt91JSjXWOhuIvU+7ocD8FHwZhHqr2EI9LdXR4eC+ez8PV4DLEZ8/dX8Bxy4u62jiC3iv9vPzX83556LQNfP2nvA+RmFbrokMflBgu8WS7D1OqUPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOZeYgcx; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-516d15ed2bcso101966251cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 02:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780392408; x=1780997208; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Md4hiUePTg+5wfFpWCPNi1KpT4E53tO51pMj7M2RLpo=;
        b=JOZeYgcxBCKoFoMoZjtiTClkH5+rfeRiKosgaP7N2QQogRbTuAcnE/12+5qt5CCY9Y
         YarCenbTVK7iIp0ebzhwL1CLcTe5BAsLQpbMHRmdz+1tdavk8LKFGn8BaxHYYkyM5Vmz
         gWDQExSV5YnI+MaUhPzbNRwmC6VrmK7p32W0VIu3jITUNnjpoJzmEdtanjOd4r1nN7yI
         8P3EBqdbxCMAJpJXFTPRkzOmfSSPipTYyoH0YKRlij4pt/408a6xnUG+k6txODUpnB1S
         vVf6g+7DRkeNF54SZfXwkK2tjkLmnWJv8j2/OaeRq8vKjIFYvnH3y2R5CwWJk4qJk/CS
         mrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392408; x=1780997208;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Md4hiUePTg+5wfFpWCPNi1KpT4E53tO51pMj7M2RLpo=;
        b=XuSNDyMW6IWpj/Bjo/4OdFO/nUiXB4hvkiu/ABbfu85VyAuisqU9O50xmZPMqFeJME
         HcJu1APDJ9nppIa/JDXyXZ7pbFHNNJrcohi0psiNPNx8spm/3prz/YeeEZUaSh2yE9No
         kLXK5Mx1QVHQQ6x3FB3/iYIXBqGdwBCm2iA+yqco6n8Uuwzyu+ZFJ4uLpQuWbalE878C
         xNGofFjyw/46466g482JPJ6Y5P9T/gF2y1cwBcVQsDGuPIIOrPQF2ptDWzh17V8AAtId
         WpTjxWfaZVSB4VitRJZXBa538LURNCb2VEv5YD9+uKY22FftDCdA9MZjjC3E2D0oIeSz
         2cog==
X-Forwarded-Encrypted: i=1; AFNElJ/FcDjYrvt/Ba9tLAml1DZEtCfB3n4+IPa/3++BMQ7jF3HXCfi0yWn398EUcElON8dHqN4SZ0EnqHZe@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmyB2Dw10IousUcMJHoten8azQrO3u/Sw0W5Zp34zz+d5Ut6H
	WEn+wcxhuQavL0ziCzEkH9c8DwsWh3rWSlgqAUlxwP/2S059nyo9RRAR
X-Gm-Gg: Acq92OERkS2CDQRCkCCEvBjCoWTth0W9V/15bSYKdwlWeRaePYcpQz6M4MPwMmchLk0
	t8rFWe8a3f5kC4jOZ4df04wkNpCjLQHhu5vnZ6IFscHFNMYxRrgB1fOD6jguRboE2pcc4vDZYqj
	Ly17HAOw5SbcauUYBPwGvdacVUx6Nbjjvp+Jw22rOY0t05xE23br4VctclcTgb5meF/Jg7IuleN
	zbbyC0qh9uP4TYTWsMW8qWE5yFtaSJmn7colf2peq2I9id1+NG9qexN5U5Ysrl9YZlYbqd2XcJm
	fzdy5NNQ8Ym5hR0IZ3mjCryx+TkUVOvvFKT69jFBSLyLIXg9ODKTxqQT/DRxK9WXmX+JcCT/UA+
	HXDnHa/mt1Ufan5+HiAF3ch4KfSXs6ZFd5KLrk6gysHlJr3FDvGonsjPk9Nwj6lV29pLM4oYxVi
	U+g5yu9DXHK+qr5WUfSJ+NI/lfL7KA2qA4JMy3/Ry5CFluMqn0+H4vtEbx6HdQchV1V+bYYrXQ+
	5SdQrOmXgeWYclTIsPDXPA4svlsTiFmWSEqlmC4i62YxUYkG4Q=
X-Received: by 2002:a05:622a:1812:b0:50f:c9a2:1643 with SMTP id d75a77b69052e-517662835efmr36605851cf.11.1780392408389;
        Tue, 02 Jun 2026 02:26:48 -0700 (PDT)
Received: from localhost ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5176e062a2esm6993281cf.7.2026.06.02.02.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 02:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 02:26:44 -0700
Message-Id: <DIYGFNLIFBW7.21W9J6SUGYF72@gmail.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>, "Rosen Penev"
 <rosenp@gmail.com>
Cc: "Madhavan Srinivasan" <maddy@linux.ibm.com>, <chleroy@kernel.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas Piggin"
 <npiggin@gmail.com>, "Linus Walleij" <linusw@kernel.org>, "open list:LINUX
 FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, "open
 list" <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 5/7] gpio: ppc44x: Convert GPIO to generic MMIO
From: "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602050131.856789-1-rosenp@gmail.com>
 <20260602050131.856789-6-rosenp@gmail.com>
 <CAMRc=Me0rqs8nxrp95X-2Bjw059ahRxwKrg-NtmEt025w2m9bw@mail.gmail.com>
In-Reply-To: <CAMRc=Me0rqs8nxrp95X-2Bjw059ahRxwKrg-NtmEt025w2m9bw@mail.gmail.com>
X-Rspamd-Queue-Id: 81B9662B7C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37806-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,lists.ozlabs.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue Jun 2, 2026 at 12:51 AM PDT, Bartosz Golaszewski wrote:
> On Tue, 2 Jun 2026 07:01:29 +0200, Rosen Penev <rosenp@gmail.com> said:
>> Use gpio_generic_chip_init() to set up the PPC44x GPIO chip
>> instead of open-coding the basic get, set, locking and state handling.
>>
>> Keep the PPC44x-specific direction callbacks because they still need to
>> program ODR and the OSR/TSR registers around the generic data and
>> direction registers.
>>
>> Assisted-by: Codex:GPT-5.5
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>
> ...
>
>> @@ -124,10 +102,11 @@ static int
>>  ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>>  {
>>  	struct ppc4xx_gpio_chip *chip =3D gpiochip_get_data(gc);
>> +	struct gpio_generic_chip *gen_gc =3D &chip->chip;
>>  	struct ppc4xx_gpio __iomem *regs =3D chip->regs;
>>  	unsigned long flags;
>>
>> -	spin_lock_irqsave(&chip->lock, flags);
>> +	gpio_generic_chip_lock_irqsave(gen_gc, flags);
>
> If you're already doing it, can you use lock guards too?
Sure. btw, I avoided placing

https://lore.kernel.org/all/20260517063754.21819-1-rosenp@gmail.com/

in the beginning of the series. My thinking is that's for older kernels.
I believe either the generic API or devm_gpiochip_add_data fixes this.
>
> Bart


