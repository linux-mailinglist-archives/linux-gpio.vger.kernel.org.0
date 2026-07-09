Return-Path: <linux-gpio+bounces-39743-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xrsOOlumT2rrlgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39743-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 15:47:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 407CC731BD6
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 15:47:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Wl5HMmn7;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39743-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39743-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDF3630A9146
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 13:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF372DB780;
	Thu,  9 Jul 2026 13:37:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E49F2D46A1
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 13:36:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604221; cv=pass; b=blXeXS3+e5MG8iLQBqWOyq074KRHk16VnoBV0Cl7LTNz6szdezy8w7MTSRwwNEpybmUHJ0me+P3aQm020MegrwbAujeZYE4vxoD5vpJQuWN3JvLqCv7Xv3fXo6/AyGyvAlT35oVaN4GgFgN0xAmLUzUkUFqPgpjdcOh6FJJlYCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604221; c=relaxed/simple;
	bh=qhLTQyxsHa4qv8JWIL4ToJx1jZKdorXD7fURMyGcU1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVhIvNpq8S88HcBYWQ/hpoe2hI6G/fgEqjMHkYuLngjHgwtveMxZX6snkCcTACvKWq/BQRoFj1HHj6RaNZ6aJLpLmdUWQVMTNQ6Zne2E70nRMhg6SDf1KB4bkjH0cQgypmpAVO4mpwo3UBvbds5x0d5Zu9GSVDie03BUWhC3gpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wl5HMmn7; arc=pass smtp.client-ip=209.85.221.171
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bd95de6865so308807e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 06:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783604218; cv=none;
        d=google.com; s=arc-20260327;
        b=JrJjiNOs17wnSJvez1oloX31DrQapBHwoADeld78l+txCi+QbPY+lTt+DOcR4S93rO
         dfsnFzEJ5EBzV6HhQfiYpkahGbH9jyuR9IpMaKgCi6YDvl+/rSS7mXBodCz+i7mXwGQ1
         tgfxmzMdw0xD73rxVzyUoKI4wj44/CGjJsa28l0teujDAUh8EOxVuQnad27J/b0/VBN3
         AA8TIDTE73kqDx2PVJO7jziD42r0gAjbur0vVDwwqvLs/m5ixg/Zci1LpfFZIE71YqAE
         gyNNbB3CrHE67mc9tCu5lQpndwWmAccjrB+8KwpO7GOt4jwiry1VdbVbbrxYGsKe7ELF
         KPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UeVcevBZMj9mwINAjSZxGwJsoQQZhegZRGV2Y9ZhG8Q=;
        fh=6QyvL+FhKCY2h9kzp9iJoJDF9Y5DaXH0ojGVy6YxMmg=;
        b=IP4JpHNOlftAVDxrrGGsZrKItimkOuJY39Rz4CwiEQzqEhRoWrem97uwc7jEylwvFW
         NXLnQ8AmikD4FvgCYDnYFMtzwXrSuZZc4Z+wNdJ6M8QRhzr8J1fPR4ucqL7JhXwSldCl
         Ek1Q2Vdr3+XwMuYHeJw0Z5CwaKU0hZJRRQNTfv4w5XPyz9QOl9342mJEknCiNPtjE+Ai
         CAng4cBgSrKHeRTak/2xP+miryH2rxmJqugutCWWKC6jujxvYCjKi1VbPcAWByAydvOE
         HOltLBE2VZGTzygAKzazGoqn0Q3JFivvJCPiz0PKvXLBwdDQKevWUGQkSiCg95Jd/Oy7
         x3MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783604218; x=1784209018; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UeVcevBZMj9mwINAjSZxGwJsoQQZhegZRGV2Y9ZhG8Q=;
        b=Wl5HMmn77Tpxlu87bAx5KLASlp/wdvLmXDYAdL4HPMeyKTmCD8CawYiOSQDLQRHooC
         5Pt2vZHmDAV9fAOVruh583yQZkETBWz5D5ohU/X6fGKY8jaj0y7HHHqPduLPcdNkIprh
         BdC6pWk/Ca2TDzrQlmfkFueJiGpNI95BP6io7Y3K/WmqGdl+ttkIjItMSPCz69v6VZ0e
         pmfVStSki/HiOj06/4jAs/+pI/T7e2Yj7bUkdy6SNkr4zGy6aICjmZLARcawDj0V15DV
         dS7vMkYkc8YJJNkM68Q5DdehEoZv1m3KRfq6S52f8l9qqz0GIzNfuT55aSJEy3mxuWnh
         /z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604218; x=1784209018;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UeVcevBZMj9mwINAjSZxGwJsoQQZhegZRGV2Y9ZhG8Q=;
        b=noycyTdsVLd5SLy6tpEogOmKsPQQpujLDMMrfTPSFf1aoteUjxohBIdELu3CRlD+7t
         S85YaaDTadlt7wpnVzRjs03I34AsPslQGZLoDUTlbAoOYuGQfKlyKraWCLut0M6QoITG
         DEdbDl4ShF5ROyHiMR7j4npo6fhzyL5WL0CZjEuVSWIM2+ZNM8tgya3sfBmm4pWPIgRe
         uP7v7nw54uu4x4quvutTsdx1MxbkDucgKOLXQTim78lfBOOv2kZIN3yq9QYx0eGhev9a
         3OwVwqdDa3bkGvupd7rNbY5CNI43s/CaFwSQBShczEcm1ng/0Hto+80pw8PIV6fKCCKB
         NB3A==
X-Forwarded-Encrypted: i=1; AHgh+RoCF+84S2kWhspxOi98Xk9pHZjY0ssNhqCn5/VlsW2K5xLh611tscIdiSvxVKDLHP6/4CptUDdK1sxb@vger.kernel.org
X-Gm-Message-State: AOJu0YwHf2xjKikwOsA8hEovOwYI4PBKQO3gLoIt9WldtRL5H1qdXKby
	ZNvyKN3sUWrM96vW1rHgBTERtdVpJRL7uyS2YX3/TxTlb+L8vyvnqzk/nUvz7TfklaTmllWe0eV
	eeWaTlneJx9ksjeKjIvw2843L3jSlIzl3mCFjNYo1hatrcpsn20XMwsbWvA==
X-Gm-Gg: AfdE7cmREcagBkT6ENa/7P0KNLW0rxN55TLVYwUqk5iLb9xqFMfC+f2Onyq1soVAoER
	8U3nYHtrCxwCv41eWOqspVOr+qoMhSzOzc2AACITP0RdJzMw+rOb0/WyAGBRtmYc72U9PMBVLWm
	UHfC2hQzow0vzbEtDxnBtfhO+4jKcJ+uRdMmIUBocN764UBCYl8+0KQeML++BVP7BBC8lGDKkYL
	OoMvkreLBRuVJOv/BQBJ0n0sIGsRhq4N3zg6McojDxdy80PpI+q+UVCev7dcNa8KAE+O+3tO4y1
	aSbUFYTA52Jb/kQsUVw6Y21CLpMK+7g=
X-Received: by 2002:a05:6122:50a:b0:5bf:9f77:477a with SMTP id
 71dfb90a1353d-5bf9f778075mr227070e0c.2.1783604218195; Thu, 09 Jul 2026
 06:36:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165414epcas5p183d43baad4cbc682cdc8aeca5f4b427a@epcas5p1.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-4-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-4-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:36:44 +0100
X-Gm-Features: AUfX_mwhsgBGzVvv5RjxdYWk5NHDezKo0zDdPRWFqx3TI_wi5rvWYrlK8rb8Srw
Message-ID: <CADrjBPp_ZvfN7E-RUvnqWCz_SJCL_bSRnnoj2PnQdRTUapor2A@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] pinctrl: samsung: Add Exynos8855 pinctrl configuration
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39743-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:krzk@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:dkim,samsung.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 407CC731BD6

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add pinctrl configuration for Exynos8855. The bank type
> macros are reused from EXYNOS850 and GS101 SoC.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 132 ++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>  3 files changed, 135 insertions(+)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index fe9f92cb037e..1aa977d2a1f8 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -943,6 +943,138 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
>         .num_ctrl       = ARRAY_SIZE(exynos850_pin_ctrl),
>  };
>
> +/* pin banks of exynos8855 pin-controller 0 (ALIVE) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks0[] __initconst = {
> +       GS101_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00, 0x00),
> +       GS101_PIN_BANK_EINTW(4, 0x020, "gpa1", 0x04, 0x08),
> +       EXYNOS850_PIN_BANK_EINTN(3, 0x040, "gpq0"),
> +       EXYNOS850_PIN_BANK_EINTN(2, 0x060, "gpq1"),
> +       GS101_PIN_BANK_EINTW(1, 0x080, "gpc0", 0x08, 0x10),
> +       GS101_PIN_BANK_EINTW(1, 0x0a0, "gpc1", 0x0c, 0x14),
> +       GS101_PIN_BANK_EINTW(1, 0x0c0, "gpc2", 0x10, 0x18),
> +       GS101_PIN_BANK_EINTW(1, 0x0e0, "gpc3", 0x14, 0x1c),
> +       GS101_PIN_BANK_EINTW(1, 0x100, "gpc4", 0x18, 0x20),
> +       GS101_PIN_BANK_EINTW(1, 0x120, "gpc5", 0x1c, 0x24),
> +       GS101_PIN_BANK_EINTW(1, 0x140, "gpc6", 0x20, 0x28),
> +       GS101_PIN_BANK_EINTW(1, 0x160, "gpc7", 0x24, 0x2c),
> +       GS101_PIN_BANK_EINTW(1, 0x180, "gpc8", 0x28, 0x30),
> +       GS101_PIN_BANK_EINTW(1, 0x1a0, "gpc9", 0x2c, 0x34),
> +       GS101_PIN_BANK_EINTW(1, 0x1c0, "gpc10", 0x30, 0x38),
> +       GS101_PIN_BANK_EINTW(1, 0x1e0, "gpc11", 0x34, 0x3c),
> +       GS101_PIN_BANK_EINTW(1, 0x200, "gpc12", 0x38, 0x40),
> +       GS101_PIN_BANK_EINTW(1, 0x220, "gpc13", 0x3c, 0x44),
> +       GS101_PIN_BANK_EINTW(1, 0x240, "gpc14", 0x40, 0x48),
> +       GS101_PIN_BANK_EINTW(1, 0x260, "gpj0", 0x44, 0x4c),
> +       GS101_PIN_BANK_EINTW(1, 0x280, "gpj1", 0x48, 0x50),
> +       GS101_PIN_BANK_EINTW(1, 0x2a0, "gpj2", 0x4c, 0x54),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 1 (CMGP) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks1[] __initconst = {
> +       GS101_PIN_BANK_EINTW(1, 0x00,  "gpm0",  0x00, 0x00),
> +       GS101_PIN_BANK_EINTW(1, 0x20,  "gpm1",  0x04, 0x04),
> +       GS101_PIN_BANK_EINTW(1, 0x40,  "gpm2",  0x08, 0x08),
> +       GS101_PIN_BANK_EINTW(1, 0x60,  "gpm3",  0x0c, 0x0c),
> +       GS101_PIN_BANK_EINTW(1, 0x80,  "gpm4",  0x10, 0x10),
> +       GS101_PIN_BANK_EINTW(1, 0xa0,  "gpm5",  0x14, 0x14),
> +       GS101_PIN_BANK_EINTW(1, 0xc0,  "gpm6",  0x18, 0x18),
> +       GS101_PIN_BANK_EINTW(1, 0xe0,  "gpm7",  0x1c, 0x1c),
> +       GS101_PIN_BANK_EINTW(1, 0x100, "gpm8",  0x20, 0x20),
> +       GS101_PIN_BANK_EINTW(1, 0x120, "gpm9",  0x24, 0x24),
> +       GS101_PIN_BANK_EINTW(1, 0x140, "gpm10", 0x28, 0x28),
> +       GS101_PIN_BANK_EINTW(1, 0x160, "gpm11", 0x2c, 0x2c),
> +       GS101_PIN_BANK_EINTW(1, 0x180, "gpm12", 0x30, 0x30),
> +       GS101_PIN_BANK_EINTW(1, 0x1a0, "gpm13", 0x34, 0x34),
> +       GS101_PIN_BANK_EINTW(1, 0x1c0, "gpm14", 0x38, 0x38),
> +       GS101_PIN_BANK_EINTW(1, 0x1e0, "gpm15", 0x3c, 0x3c),
> +       GS101_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40, 0x40),
> +       GS101_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44, 0x44),
> +       GS101_PIN_BANK_EINTW(1, 0x240, "gpm18", 0x48, 0x48),
> +       GS101_PIN_BANK_EINTW(1, 0x260, "gpm19", 0x4c, 0x4c),
> +       GS101_PIN_BANK_EINTW(1, 0x280, "gpm20", 0x50, 0x50),
> +       GS101_PIN_BANK_EINTW(1, 0x2a0, "gpm21", 0x54, 0x54),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 2 (HSI UFS) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks2[] __initconst = {
> +       GS101_PIN_BANK_EINTG(2, 0x0, "gpf3", 0x00, 0x00),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 3 (PERIC) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks3[] __initconst = {
> +       GS101_PIN_BANK_EINTG(8, 0x0,   "gpp0", 0x00, 0x00),
> +       GS101_PIN_BANK_EINTG(8, 0x20,  "gpp1", 0x04, 0x08),
> +       GS101_PIN_BANK_EINTG(6, 0x40,  "gpp2", 0x08, 0x10),
> +       GS101_PIN_BANK_EINTG(4, 0x60,  "gpg0", 0x0c, 0x18),
> +       GS101_PIN_BANK_EINTG(3, 0x80,  "gpg1", 0x10, 0x1c),
> +       GS101_PIN_BANK_EINTG(6, 0xa0,  "gpb0", 0x14, 0x20),
> +       GS101_PIN_BANK_EINTG(4, 0xc0,  "gpb1", 0x18, 0x28),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 4 (PERICMMC) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks4[] __initconst = {
> +       GS101_PIN_BANK_EINTG(7, 0x0, "gpf2", 0x00, 0x00),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 5 (USI) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks5[] __initconst = {
> +       GS101_PIN_BANK_EINTG(8, 0x00, "gpp3", 0x00, 0x00),
> +       GS101_PIN_BANK_EINTG(2, 0x20, "gpp4", 0x04, 0x08),
> +       GS101_PIN_BANK_EINTG(2, 0x40, "gpg2", 0x08, 0x0c),
> +       GS101_PIN_BANK_EINTG(1, 0x60, "gpg3", 0x0c, 0x10),
> +};
> +
> +static const struct samsung_pin_ctrl exynos8855_pin_ctrl[] __initconst = {
> +       {
> +               /* pin-controller instance 0 ALIVE data */
> +               .pin_banks      = exynos8855_pin_banks0,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks0),
> +               .eint_wkup_init = exynos_eint_wkup_init,
> +               .suspend        = gs101_pinctrl_suspend,
> +               .resume         = gs101_pinctrl_resume,
> +       }, {
> +               /* pin-controller instance 1 CMGP data */
> +               .pin_banks      = exynos8855_pin_banks1,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks1),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +               .suspend        = gs101_pinctrl_suspend,
> +               .resume         = gs101_pinctrl_resume,
> +       }, {
> +               /* pin-controller instance 2 HSI UFS data */
> +               .pin_banks      = exynos8855_pin_banks2,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks2),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +               .suspend        = gs101_pinctrl_suspend,
> +               .resume         = gs101_pinctrl_resume,
> +       }, {
> +               /* pin-controller instance 3 PERIC data */
> +               .pin_banks      = exynos8855_pin_banks3,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks3),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +               .suspend        = gs101_pinctrl_suspend,
> +               .resume         = gs101_pinctrl_resume,
> +       }, {
> +               /* pin-controller instance 4 PERICMMC data */
> +               .pin_banks      = exynos8855_pin_banks4,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks4),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +               .suspend        = gs101_pinctrl_suspend,
> +               .resume         = gs101_pinctrl_resume,
> +       }, {
> +               /* pin-controller instance 5 USI data */
> +               .pin_banks      = exynos8855_pin_banks5,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks5),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +               .suspend        = gs101_pinctrl_suspend,
> +               .resume         = gs101_pinctrl_resume,
> +       },
> +};
> +
> +const struct samsung_pinctrl_of_match_data exynos8855_of_data __initconst = {
> +       .ctrl           = exynos8855_pin_ctrl,
> +       .num_ctrl       = ARRAY_SIZE(exynos8855_pin_ctrl),
> +};
> +
>  /* pin banks of exynos990 pin-controller 0 (ALIVE) */
>  static struct samsung_pin_bank_data exynos990_pin_banks0[] = {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 5ac6f6b02327..5ecc9ed4c44d 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1500,6 +1500,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
>                 .data = &exynos7885_of_data },
>         { .compatible = "samsung,exynos850-pinctrl",
>                 .data = &exynos850_of_data },
> +       { .compatible = "samsung,exynos8855-pinctrl",
> +               .data = &exynos8855_of_data },
>         { .compatible = "samsung,exynos8890-pinctrl",
>                 .data = &exynos8890_of_data },
>         { .compatible = "samsung,exynos8895-pinctrl",
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
> index 937600430a6e..bb02fb49b2af 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -396,6 +396,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos7870_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
> +extern const struct samsung_pinctrl_of_match_data exynos8855_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos8890_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos9610_of_data;
> --
> 2.34.1
>

