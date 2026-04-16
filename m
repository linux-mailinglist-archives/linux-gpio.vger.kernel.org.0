Return-Path: <linux-gpio+bounces-35192-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF80H8u24GlYlAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35192-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 12:15:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6D840CCAA
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 12:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E81A3307AE4F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 10:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59E639E178;
	Thu, 16 Apr 2026 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQ8fs2p/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61939C007
	for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2026 10:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334468; cv=pass; b=ur3zSZ9LHXQ8z+UqiINUG9rtmZ6+MPVdDxsn0aYv+ETBaeYJ5Jkp7sPKRWP8V5XcZd+RtUNLE/4jUBXibkmkpgPdU5SPfgoVfXseHfoFSoueUsAbjH70+rRbCP5OexI3bBtJvWugGF1yh4ZsUsotN0yyZAtlI4VyFAR5KH8q0rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334468; c=relaxed/simple;
	bh=omyk2QDaBscrlxBpLHNewuJklMUvM2h9mNwfbrOeZEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=OpYhsDUj5gnNno8fvBVLtRZ7YQCd988e3vJD+0mErbWQQQ4Ol8lm1At/4n6O3qOVIXsJHcFyHw1tmkw/92bbJQoz9snWsQvuc/bGNs6J7LmzXul/bSMc/3w/g/SgFqyOZblaJS3UmA4sz67TR+G03HUyRk1uA3VEng4/Kym7p2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQ8fs2p/; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6530287803cso235350d50.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2026 03:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776334466; cv=none;
        d=google.com; s=arc-20240605;
        b=jIsl8xvZ+HJIeEokA2tD332ZBWpWsImJumyAfb8pg5iTwGg/m0IhrM7j1zzgFkHP/j
         sr42kkgIcBRifYU8cr1Hqm1M+t6UPOX1Xqqlu6zYueV2I1lSpC02I52acaXhKYB7w4OR
         Qvdco91BYCY9cOQyFdXvE8rWemixjo7nL99fh0xeq+i4SjIWN/V4Xrp1k2ZaRwvpOpkV
         yOfPjXV0TMh2aKItEjXMNSPw4HbXqs9UF8Jz9dCwupcg7XMnJJX0emkfsBiBbdt0tfYZ
         K67M97KLZewRJ2TBtOrp9Nj2s6OUSKfpH6E9LAiG6U3H6a8z9b0n9/HWQKwBewHNyexU
         YRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=n1rjmbekfBau2Htq8B+TCJW49W+rgbnu1bxSBFHQQuc=;
        fh=zmgO3K6pj0BROhxpN/4noSAx+fNZHKVydltAqygeFiQ=;
        b=EXWuINUj+nuZKZEIm8KbeceF2OCs3YAz8AKyiKpmH7nefZhvyYJkFwajF6UaH5yn+c
         rFep6sXoBxTlx8hTP+K4/iF4qli0FYln5UhE7vgXQ8UQWA4E+FEBuyEKOk+drSkMBCCk
         Yc23hK1ah+1WEW5EyDkguPc9jO4B7OLVsTqbsUStzCJVvAyYASVPpK/MX1VR/4ZnHjwI
         JKWKhfShvQwayiLqocKf3sFLOaGkRkfODaHW6cxgQSVdbAoiycepa44ufrRsrAKYqR48
         IRn9BW65bZnMAN0gj47+alF67c0I4SNF1bHN/1Wgv9dPc8L4X6bNwIDjw/OveJs7xVd/
         9UnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776334466; x=1776939266; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1rjmbekfBau2Htq8B+TCJW49W+rgbnu1bxSBFHQQuc=;
        b=GQ8fs2p/h4bjE2J+uZXFtxG//+/i2ippk/rSm6kua/Rj8Jde4V2zEBgT+RVGDfzuVY
         3q3KSgks6TidJhCOwt7FSC5ce5DXY1jhU491Saq6Le3LmmFKy077uxCLWSP2W69SGmp4
         gM6RFX0D4DbjjW26fVTojHtUD/EQ9aL37ZXf/yM+XnLcjMSBACYLnBbgwDm7TUXOdo0p
         rJUABHH3P4Hid7WxW15K3cqbVW+E3kTDG1t4zx75hobepXLzGu7ubSDHuXJMf8+UtMTw
         aGx9f5wPFG7NpI+9NQh+OkkekDcnXydm8hZT48/QeibGTZ+P3FPdoLN2UNIU8G0uR1il
         MAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334466; x=1776939266;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1rjmbekfBau2Htq8B+TCJW49W+rgbnu1bxSBFHQQuc=;
        b=Fp3kbeoAyRUgpSkeZi/6FDoXZhLxoM3kmXNt4m/QmUUv6wPjs0bEzlH3ffjCIuthRM
         5uyJaifKYdIOLVGfvjyTYTWWk+C0MiGvynh+y7auOwF2asvKhYKaxBe02dqr58CrWYt9
         oM0wLHvCciNGTE4a3SDeUdzpq4mwvHeuhNPv15R6TMZURun8dZBF2sQ3FnYJqPi3qZIp
         mMJ27I1E8lmAcNVKB7rXF7OdzyWk1duU2dVNpJ4DKjNLpEsYuyXrPyzKKV3/SZj0tHbn
         ZcefODlNOFn+7h9eF9E5MCfY3BHxgmwWCI96tWIGb5Qa486omuI6VHWrEhvAKA3c22IF
         q9sA==
X-Forwarded-Encrypted: i=1; AFNElJ/OtJrG4umVVOOKhb9ayNa1fhR09Nz1Xxj2w2M2PgAg5X5clploPR1EmM7mgDTP2imMV/xIi6M3r5jI@vger.kernel.org
X-Gm-Message-State: AOJu0YxMsIOEWWSn9KgiAElVAD+yqYrn/GoRLbco+PPiwQrc5lGjlmYr
	9L8P1kEQ7sSLOp8ylqeP860TCx1VOTkEOFbQA5npd7ucXbuPzt4Bx89AFyAK6fZQegGv2IzbBuG
	z/RafoR7esecsEFbjHoM1L7NStPsJRHs=
X-Gm-Gg: AeBDiev+EI+7EudQAOpHVGb+a4ohrvKDFWs2TQRg5b3xelc2f0qDHnXuQHsFYgru0Xb
	NV69MwTH38empWvJjJiwgsUxCA47OFnz6T69sIzu5KyE3iJ3Mj5BK5SiSu7qXY8CSMnJ+TL4VGN
	Azw3xb2W4eDwyfgjH0/dQZNcBgj12MqVP8l8Owh1JOecMkq0jp0umJjBsuFXuR3UuE5weQ6EtAl
	hp8Nyw/JarW075sdemfpQ5KGCbpxSFLXh2e/n7pVY2JY3/t+JKzVA8BdXplSyqK0tYcLz0yoeCd
	uD0jKoDHvNHVV+PrDqi5
X-Received: by 2002:a05:690e:1507:b0:64e:a1d0:1142 with SMTP id
 956f58d0204a3-65198aed930mr19836431d50.30.1776334466309; Thu, 16 Apr 2026
 03:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413144012.3009310-1-lgs201920130244@gmail.com>
In-Reply-To: <20260413144012.3009310-1-lgs201920130244@gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 18:14:12 +0800
X-Gm-Features: AQROBzCnBVXTwlIwINOlLEsUngN0_VDTNq_XueRkOnBrN1R_ctNxWasBKhCqXEg
Message-ID: <CANUHTR8v7BMLuw7ESnQFsX_QSgRqBSu=bzri8LzC5M2MQcJXMQ@mail.gmail.com>
Subject: Re: [PATCH v2] misc: microchip: pci1xxxx: fix IRQ vector leak in gp_aux_bus_probe()
To: "Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>, 
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35192-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE6D840CCAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Mon, 13 Apr 2026 at 22:40, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> gp_aux_bus_probe() allocates IRQ vectors with pci_alloc_irq_vectors()
> before initializing and adding the second auxiliary device.
>
> When pci_irq_vector(), auxiliary_device_init() or auxiliary_device_add()
> for the second auxiliary device fails, the function unwinds the auxiliary
> devices and ida allocations, but leaves the allocated IRQ vectors behind.
>
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review. Add a dedicated error path to call
> pci_free_irq_vectors() after IRQ vectors have been allocated
> successfully.
>
> Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus driver for the PIO function in the multi-function endpoint of pci1xxxx device.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> v2:
>   - note that the issue was identified by my static analysis tool
>   - and confirmed by manual review
>
>  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> index 34c9be437432..5e1f99a35100 100644
> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> @@ -93,14 +93,14 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
>
>         retval = pci_irq_vector(pdev, 0);
>         if (retval < 0)
> -               goto err_aux_dev_init_1;
> +               goto err_irq_vectors;
>
>         pdev->irq = retval;
>         aux_bus->aux_device_wrapper[1]->gp_aux_data.irq_num = pdev->irq;
>
>         retval = auxiliary_device_init(&aux_bus->aux_device_wrapper[1]->aux_dev);
>         if (retval < 0)
> -               goto err_aux_dev_init_1;
> +               goto err_irq_vectors;
>
>         retval = auxiliary_device_add(&aux_bus->aux_device_wrapper[1]->aux_dev);
>         if (retval)
> @@ -113,6 +113,9 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
>
>  err_aux_dev_add_1:
>         auxiliary_device_uninit(&aux_bus->aux_device_wrapper[1]->aux_dev);
> +
> +err_irq_vectors:
> +       pci_free_irq_vectors(pdev);
>         goto err_aux_dev_add_0;
>
>  err_aux_dev_init_1:
> --
> 2.43.0
>

I re-checked this issue on our side and found that my previous
analysis was incorrect. This patch is therefore not needed.

I'll drop this patch.

Sorry for the noise, and thanks.

Guangshuo

