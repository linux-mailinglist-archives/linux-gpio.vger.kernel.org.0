Return-Path: <linux-gpio+bounces-35193-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJlUH7S24GlYlAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35193-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 12:15:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C44540CC75
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 12:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85FD030240B0
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 10:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE879313558;
	Thu, 16 Apr 2026 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKXuQdC9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6739EF04
	for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2026 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334511; cv=pass; b=HXkFXwIBw+gyNrqimRHm0fEDNMQuPRq7kYP8cHj//F78x548uCJYrQfv7aeT3DdncrCxnVy3GYA8QU6Oj7WDzf0caOzsf2uqbf7DN2pAcS1M1QmjhuupWgVbyz3bW7Bfff9YITT5sM+dE6/Mm57dT2JEMxsf7agpWR7nN/7/3+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334511; c=relaxed/simple;
	bh=W14sY8rFVQP5R86DvhFB8pwK3PIqD2viK/+q2E9YJ5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heogdfqpenAxNvGHJmEvaiD2h04rVrYq8oniDwgduMhHqumy69JDBG2gz3xgvO8ASGyehwwDMis2dYTk7IR9/z2vmGb703egdrmF0Hn2DsBxSJTk0vf3l98d6gXDh11V+LWqRnGJnp807FKKY7pwqcj6hlSNgFkpsCKXlOG3RSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKXuQdC9; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6501d242e3fso7423241d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2026 03:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776334509; cv=none;
        d=google.com; s=arc-20240605;
        b=CnRYVD+zcnjedliqXkpQfk5MxVOxZH2jwUOLj/Ijpa7Kk7xSqKAQAL8Bd1oEmvRIeR
         q7tpwDuZsd8pWT5oWNWeRT7XXZXDI89o2b6gTB8RqVGHa1bmDz/MEznGl43rvXiKtVCg
         j+PNdMa3BE9B/Zv4rt7xOVpfsebGf2sE1uf9O4EwWB6HmuJEyaeikES2pLj02pfzK/MV
         poSB4oZZUlS+HCUUDcdQApsNsQhhRBPpgCJ6vNjWMOQox5axg5FTyMBnns+HxVWWV6Pe
         rY3DUa0dWlnQvtJ/RjubRIla5ws5WN3Y64FQGZ0xfj0Z4OR8QNTffdhoeu/cjuA6e4UE
         7aUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MIU0mNT5q/kCll0NZpz4oa7I+7IP+1P1zx78jkbqb28=;
        fh=IfuqZzxv0CS6z09iAe0CSUIZLpHCMqx6xhJVTQflvVY=;
        b=bUSM8CPshpLdq7odxduntB9cDSHNVp9FZtFoYLp4wBq4Ot4hL3y64PlCqSjLlvAyCy
         tlL+Z7lpJe2g/0UhBidNdWd9BdVzHFioEaF6+HbtMPmA38t/J8yMf0LWpBAc8O2dZiFK
         3GGVxmVRZmCsaNl3xnNvcZxONlZoaD6Mmj32Dnqm1iCJ5cb5bbUCK3aquVpDfw1qKS4j
         h2YzzUUCwITcOx2wlDNcq48Z0xNhLEj/k3a4B3E+TiAGOWIHQ87ogaWCKGwsIaLSmAh9
         T4oNIaSEB4LgzgOCaRcbs/aAsCfn4vX3/jA2Dde5QtWpihx6VSBiXvZ7BT/g6ftA8tye
         uAMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776334509; x=1776939309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIU0mNT5q/kCll0NZpz4oa7I+7IP+1P1zx78jkbqb28=;
        b=gKXuQdC91ojrprddfuB+MM5IqwwSTDX3RwvSyRUgLazw8NYB0gwlLSis5TQ5hfqGJ/
         3n8oWodXQIc3Oepd0gK8snZoq6EUdx5d1IhNAU9vu2nxLslkGyBmOTpGjb8AMxPnRAGH
         3qYYaj7pix3wE2VsIANblF6vCuIz46REiZBk/r+K3Ik9atZY+F7/VVC0I/jkyijkf0v0
         3E3XQxildQhQlmwR2/HxjE99+zJwmGwVqLPIn0rxdZc215ttJUSvdgT22lb6s2MJ8Go+
         ebwp7NrOG8gtsmiU48hIbobm/zUSW0vxXg4yFUiD3BWOh9WQvbNJfjk1x7jNMGNOQF2c
         xUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334509; x=1776939309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MIU0mNT5q/kCll0NZpz4oa7I+7IP+1P1zx78jkbqb28=;
        b=Ua0UKmC9HqNE2n5C5efPtHszrtS3iw0FhTPUzNrqe6Oo8cHeYtKlGpTjDsdyURohzO
         OHQ2kcWWIpNK0y8JX8sIlSgmjRfcubh2l+cCYHlktXXv3rBtEM6qcvxslM3n4Nln//bd
         J2R+/Zh/lPK6i3wKQln3sunxMt8C+M0SMo0ONolzIy4dQV9nrUZwrUu4L/lVo8NNIaSu
         QFu6GBy6zRSRFPLFj35rbdqmlSWkjgHvj72B6CNFRHR2gy+5Ws04Wz6yD8Wf1DeDHYht
         Lqde/mLAMSWJYJ+2R/J4FCw4YT4Vo/FLaZrsDlGUTQdtyuU4v18oSWN6sp3m2a/rGAKF
         2zEg==
X-Forwarded-Encrypted: i=1; AFNElJ9poPdSpxxxHgeuQWfB9q/oblZnhUUIaQMAeWmBdRjeQibcTnhllJuXvqmZDjxvySEoQVx2hlHOzMfW@vger.kernel.org
X-Gm-Message-State: AOJu0YxdXt5GV8bqvVfAlQSXxuj9Xwh4umHHb5k9UCmgMNG+kmAiOfFU
	syAWbcR9l0HDgdWYjzoNkvG+6SsOULpTB+cN7j8nPQX/jeGqjuGF9m2blHjizCd8198XZunOCQA
	YvURim7f+cPR6Mk7qGG71/dv6UH+ynK4=
X-Gm-Gg: AeBDievcPNHF/U0wDxsdJ83UsDN6N0pyHSj++a7USNu57SupL5pLADl95jl66Deivmd
	OKimibDAECo3DVY6opsttske0EeQCP9moiRzb3k9Ni/yTQgHySy/n2EQ1AvGj4TQbaSlK+9gQe0
	R4NZHSyTy5obMym06yjKhZ6/qeRh1Ku2da0zIrnE96v20v3MgaegnfM4aYOov6zIWfSbRMxWvLu
	qGEG/VKQY0XTNXB4DaEJRjhup7xPgxFknZtqF0NqsTDJIGDTXWZQb565EhAsTxf0pspEfnJgJiJ
	P3hPgX9MnPFhJ5ws9AqR
X-Received: by 2002:a53:df4a:0:b0:64a:d04e:a340 with SMTP id
 956f58d0204a3-65198a57036mr16625320d50.11.1776334508728; Thu, 16 Apr 2026
 03:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412133356.2536585-1-lgs201920130244@gmail.com>
In-Reply-To: <20260412133356.2536585-1-lgs201920130244@gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 18:14:54 +0800
X-Gm-Features: AQROBzAzpUVwDqsuwaFup_uU3Pw92c3_Go_sblTv00ait3DeiQxzl9cHn1aUjew
Message-ID: <CANUHTR-s4dJCy8j2qXtsgTX8N9SFTJiipYnaM5TngUBpRWsqxQ@mail.gmail.com>
Subject: Re: [PATCH] misc: microchip: pci1xxxx: fix IRQ vector leak in gp_aux_bus_probe()
To: "Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>, 
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35193-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2C44540CC75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi=EF=BC=8C

On Sun, 12 Apr 2026 at 21:34, Guangshuo Li <lgs201920130244@gmail.com> wrot=
e:
>
> gp_aux_bus_probe() allocates IRQ vectors with pci_alloc_irq_vectors()
> before initializing and adding the second auxiliary device.
>
> When pci_irq_vector(), auxiliary_device_init() or auxiliary_device_add()
> for the second auxiliary device fails, the function unwinds the auxiliary
> devices and ida allocations, but leaves the allocated IRQ vectors behind.
>
> Add a dedicated error path to call pci_free_irq_vectors() after IRQ
> vectors have been allocated successfully.
>
> Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus drive=
r for the PIO function in the multi-function endpoint of pci1xxxx device.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c b/drivers/misc=
/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> index 34c9be437432..5e1f99a35100 100644
> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> @@ -93,14 +93,14 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id
>
>         retval =3D pci_irq_vector(pdev, 0);
>         if (retval < 0)
> -               goto err_aux_dev_init_1;
> +               goto err_irq_vectors;
>
>         pdev->irq =3D retval;
>         aux_bus->aux_device_wrapper[1]->gp_aux_data.irq_num =3D pdev->irq=
;
>
>         retval =3D auxiliary_device_init(&aux_bus->aux_device_wrapper[1]-=
>aux_dev);
>         if (retval < 0)
> -               goto err_aux_dev_init_1;
> +               goto err_irq_vectors;
>
>         retval =3D auxiliary_device_add(&aux_bus->aux_device_wrapper[1]->=
aux_dev);
>         if (retval)
> @@ -113,6 +113,9 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id
>
>  err_aux_dev_add_1:
>         auxiliary_device_uninit(&aux_bus->aux_device_wrapper[1]->aux_dev)=
;
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

