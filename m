Return-Path: <linux-gpio+bounces-37056-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLCtOLMGC2r4/QQAu9opvQ
	(envelope-from <linux-gpio+bounces-37056-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:31:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8521456CB37
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99C213019153
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 12:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5DD405865;
	Mon, 18 May 2026 12:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYyj1y55"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1005405847
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 12:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107116; cv=pass; b=r4O7WhDHRDXx0lpm9rmitwP3+vG5XyhuLJ6VkFu5xcBHdeAU/Bd6RNMIW5b23hOKieZuNQna8h4RqjWjDu441D6SlrvVpEu1In6FIgcLG5gzaBtGwmHstu86dujkm85iyXIs1o74RSrc1NzZiEg6L8+12cNHWaM2USeXMbTZcNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107116; c=relaxed/simple;
	bh=0hqzCRIw6eHbGaqGb1/qhmAHcg9W6fExRxkcWr0itBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PX5QpG8VY+uOfKYPE6HOd24yUBhRhAgGZXf+EdY7xP11K/XtuD541lw9D8rNA+7iqsWg9OX3a/oDFrGRbPBmIUVICcQiGFVJc+F+oASGG7b0xNWPFahSk2tyCVDSRlnRKGwIdkujL7K3iNE5gXwlukz8dvLqclQxHygg7i3rgHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYyj1y55; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65dd9b25829so1683314d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 05:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779107114; cv=none;
        d=google.com; s=arc-20240605;
        b=DQ38l3cZFr9wQJCEU57ykU7NjV93oWhEhtYM/0Z6fLWR/E40WLNQ+/kFNq8vJI4CU1
         zpJp3XEbRcvyFY88U/NPN+Gt6cug0WXjw/plkiQ5lNsTrYNPQNA8OhGum16suGc4+Bu6
         dtp6JSa48o6lsxc6LZ3ux8h7wIN5k0s+dbagzHOSLBZb3mvWHZK6hI+enLNs9UPGbEJ4
         lAGGRhz80eeYC/mx/h0KARfvqvYb2EQYRC7F4S2LYVUTvlhBH9+j8f7E6ye1LXC4cZ0D
         nn04NvhUi7zMIU7pR04arVxDLgeLiaEep+Ho/GXCy1I3MfySAWwOzOInSFdL5EDc4GdN
         oQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0hqzCRIw6eHbGaqGb1/qhmAHcg9W6fExRxkcWr0itBg=;
        fh=QQKQLZjF80397JScZpTbd0KU/sJq51PMLr89z6IiBjg=;
        b=KOZkXGOgAJk1GRujK4UP1bojqWSrP6TcKRWUoCFwnLe+vMMnMXPByptQsMqPKJ0+no
         015H7li2L1OjFk1pOx7RmmDrqHOTxft+2MJ76UwDgslU1JDJIh6MX9RZgVT3GFbyQ69u
         2FE1a04KLq+XTdLtq7qHvX8ryxavct5S6/Fjr7es5cr01Ty5dsrYmzQciKC21QajiGmB
         FmfZu6bpQffQpo0demtz5rr+R2aCQD8Vc+LRcnZ2Gu0wqJSprbnXycbHGzEB7t3I+1iL
         EsR/48ailLUQ3vjHZHeHfGmc0bm0OhJEkhJnR/WVv09IfwG7Xx3wxDsGYNt/ngXnb3iU
         qXIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779107114; x=1779711914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hqzCRIw6eHbGaqGb1/qhmAHcg9W6fExRxkcWr0itBg=;
        b=JYyj1y55zWx1Das1Htts6mnj7UweswfFIxetCyA9yi9PDl0K2FW/1LSrXE2L0cfr8R
         bWDc/kuYNGg2VZ/exuI7cExyW97/Nik3Xi70SKL8GVUWo0eDOPHEksxMlaS2nOplnLzn
         GmK6ZPvFeMG6jaenvZnuhzHf/unTSC4smbVZoI5K6WZ3Mbl274wsqtyZ3qpOeh8lVe1W
         3FK9yyroB9/QlAUHK2qG4GA+siOlIX2iOyofLwDfFW4e6QePlNFGe3IGhlOdmodqZWHY
         LL4t5Rr9dkahSAT4OIUSZnYnd84kcwp8pT2SnW/NUzzRfRzx+rInRfkQUc3daseDzVeU
         9orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779107114; x=1779711914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0hqzCRIw6eHbGaqGb1/qhmAHcg9W6fExRxkcWr0itBg=;
        b=JLUQFq5Oh9yelwEzaG0oyNX0f9ls4d3Qo+ZwXKc7J6zydpXrc861nWkSdDERDtkPJQ
         PWL4HhqNO2noISX4yfKjeHd7+GpxxlnArefUWknDiU5gzXTOX1QPZBtYTAGCb6ExupSa
         4q2tAW/troKT8Pi/p7jOnLYq+omkhr9ZdmPb423q89+V0DprkN7qprLWbnveg+SCshi8
         OCFtjLTtA6TC9KtW1StaNMnIUGDsL8rochI0LLUieZozjOLiNfSTAlH7YqzjFq+UidLk
         PQDAjS9hT07ZfBfvlrTUYZ6Wtk7rYAq/2jSUoiFsYzJYHY97/jOgs011mTvb6eSZYzCg
         e3Dw==
X-Forwarded-Encrypted: i=1; AFNElJ88OA2/ehZ07eXqVPocj/wf8XYjevc8H3USgTakrjb89AXpYR3IKIm0vCLKFcfqBAoG4z6r42AovXlX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5wbQaXf5YHpiTFehMqjUUoSQV2mwB+rv4Ott08gyO8k5KN4dO
	NVml+NJk2cByUvwQAG96v17K6eFVHc9ruiqtmB1X0uw0x75cPyEQf9+1a8qCg4zqegwm+0H3Jgo
	dDi80UVo8N1yehowfL/XDhbpdqDm75+Q=
X-Gm-Gg: Acq92OHoFRcAHC7cGTOxOPULLCWdiutpD2TeeV4HPKfyF1eYjXGeCB5voHUF7qKKCb0
	aRcI8iJakhJwa6toqZJgPSa2kLw6PU0o6mFWWQW/zx11n48u4ekTxemxwyivfnIqeTRbCGyDdK2
	11oykYaeqbAMdO4g1ApDubISQR3RYK5aXyvb+E56IFKj7as3smX8A1cCl0kuUUI3Th1UlmPTyUC
	0BMWd+dF48VqxWIlq8keH/Sy9mQwfY6U3sGIEPzFKeyJqWHDm/AtVblTCCXKZyyzlimgFprLaio
	EI8HaQkLBY9HV0gFjlyMysQRTGA6utiJ7b/9DHh80iGHjWcdKOF0o4QKU4h+VotXpdOzQelyBiv
	lr2LTUGPxCuQS1CydXW50AaxAs/YDKnHZztStgwo/CRTiVbpDRcY2BsWpcuwlehTMk2PXz1A5rO
	vCSrwP
X-Received: by 2002:a05:690e:191b:b0:65e:c81:3a6c with SMTP id
 956f58d0204a3-65e226dcb9dmr14933711d50.15.1779107113719; Mon, 18 May 2026
 05:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518071816.26629-1-hardikprakash.official@gmail.com>
 <20260518071816.26629-2-hardikprakash.official@gmail.com> <CAMRc=Me8ieVzXojZ=eNhBPvjjmT5gc6hJXnpC8Bc6WofDbXP4A@mail.gmail.com>
In-Reply-To: <CAMRc=Me8ieVzXojZ=eNhBPvjjmT5gc6hJXnpC8Bc6WofDbXP4A@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Mon, 18 May 2026 17:55:02 +0530
X-Gm-Features: AVHnY4Jzaa6fZJ1A-ABz9gfnbZXIeHp2ygD2-Qv9xk6fes24nlc7tQzjR2wEdcs
Message-ID: <CANTFpSU_Ba1c_R9wbjSSqnc1+_vBMAOKDvD=EVtct8hWU+Dxqw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, mario.limonciello@amd.com, 
	basavaraj.natikar@amd.com, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8521456CB37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37056-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 16:24, Bartosz Golaszewski wrote:
> The patch looks fine but I too would prefer this to be handled at a
> higher-level. If we know which ACPI devices we're waiting for and what
> the ordering should be - is it possible to somehow setup the devlink
> for the platform devices that will be the children of these ACPI
> devices?
>
> If that can't be done, I'm fine with this as a workaround.

I checked the DSDT and the kernel's ACPI dependency mechanisms. The
DSDT has no _DEP object linking AMDI0010:02 to AMDI0030:00, so there
is nothing for fw_devlink to act on. The GpioInt resource is on the
touchscreen device (TPNL/WACF2200), not on the I2C controller itself.

Setting this up at the ACPI layer would require either a firmware
change to add _DEP, or a DMI quirk in the ACPI scan path to synthesize
the dependency =E2=80=94 which would be equally quirk-based as the current
approach, just in a different driver.

I'll send v5 with your two style fixes applied.

Thanks,
Hardik

