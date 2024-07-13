Return-Path: <linux-gpio+bounces-8201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E36FB930595
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2024 14:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87C22B21948
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2024 12:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F0F12E1D2;
	Sat, 13 Jul 2024 12:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2yhnPsV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807C54C8E;
	Sat, 13 Jul 2024 12:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720874150; cv=none; b=LYojpqSOWq/KFRYvZOo/8jh5J/mOKo/0L6/5/qfNjJoguwrBtK0y4xWv0K/0YpalvtOs8uwjhkqtXyiZnsG6ByeilU/yydD2kZ5erKlZSNgoh0k9fAtDwrd1apwuTv3caBunyInj2wtW9KaWopUqYkcKXXohgudnILdu6xUL5W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720874150; c=relaxed/simple;
	bh=NpVjYkog+25E4rQygl9YoxSBv9zb0zrBY5hRbqlgJA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAWfAH1pmgPGmxo1N7q4P/2j9tOlCkHUc7bbDm7kV9rQD7Z7PTEBTuCOWiJQNBez8qp2THUNM7kOrfE4HcnAXuBK5CfHkfv0Czkz1nIfRIKiayRdQ6xI/nYQKRus3nNSXqyvYI1KER1vFWC/8WaZ38ygulzHHXf0pcDhpMsfwrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2yhnPsV; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-64b417e1511so27767787b3.3;
        Sat, 13 Jul 2024 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720874148; x=1721478948; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=owkShcGocUOtbv22a0hw2ZQ7UgHf40jkC06XKxO56x8=;
        b=W2yhnPsV3XdcZ1TdLL4sXt7QLBKsWeEGOG/fEspezFHeuRtK2hAHXbAkBoANTCT7Ay
         uxfedI8B0qPmjDZdtpTwL3m3Bw6cpimfJWN23sn6vbv3rmmfNwt4RS+nX96LHxV+npBD
         L654xsFmd5ZkH4hxbRqx7qvHLiuBrgXo0wiN/T1q0SCq2KEBV0NSIzUQTOL2iYkSkh57
         xFwOUSXuZaE7J7zaUbzwj4Q1UFbmS7zJUqWPbA9X5FWoO1lkM2jRfRG/GSshV9r7amkT
         HrFeZlWmTSYvY/OA0+HX0Lccg+geJBBh3fk/U8P/ksaOGhyDXP2eZQ2uQRpdlToOUzY8
         Dzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720874148; x=1721478948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owkShcGocUOtbv22a0hw2ZQ7UgHf40jkC06XKxO56x8=;
        b=r3pZQ8XnvWQE30DUkvUJrlZ7Pn0M2pQvgPS5DW+Bq0foFXCmmGw0+yEpU3GDmdstxd
         XWoK+iHbNp5E9J0i3+s2aZ/LKKgeEpYLpHVPGGK8CVUn8jRUZGq3DRVJKkx4F5KW5SJW
         lgHJUcPsShA+Gm4SxxLBfwZ6zcRJusEqN4ZN5mir3Ozr1boJ0qVSUuoZSPbwDRLrYPAq
         R86Vt2vwsbx+DnVbZ5I98Di8lieGaigSlssV57Yb4VEPAnZHz9Sv00eY8hnfaP7cHayr
         zqZn0Z/XsNsjGnMj5WnNHXGwiMbiaVMfTcCtG3PwcNlOECYX3i+cKNMwTUbp+tB0VaNl
         +31Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcYrryUipABBbvNEqQl/lwZSmCmTECX1ixJDLq6dHP7X9OwkhzaVElMlNCm4FfR+0HmbKdXlu7ujrkgtLC0XhtB2gSbFL885FrF4rVh2Ax4tPYxMZkIhJIUIHdpN2prB5gC4jNso1m+A==
X-Gm-Message-State: AOJu0YwJzOYiRCdo0g/OFNpDKGnPkJZ/7qRlPqQk/WiUN8K3p1Hf87u1
	bXCqBDLTrG1tya2+5i7ERM3rV4AjfRdIfENRNYVoRDViaNz/b0YR+87k2AmsHwqGWPdYu7Ue20s
	3BH8xOdlhV+TbCbuoPe5+ZZL3y74=
X-Google-Smtp-Source: AGHT+IFxVjFQgnzk7U8EbynbAHgLidXGTg+dCuDEWyhjzb0s5oKcsQWA8qjq4FBXiKSC/kd0jB508Atnx1GMKhgcc2I=
X-Received: by 2002:a81:8d4b:0:b0:63b:d711:e722 with SMTP id
 00721157ae682-658ee7905a8mr168875407b3.1.1720874148479; Sat, 13 Jul 2024
 05:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711193749.2397471-1-tmaimon77@gmail.com>
In-Reply-To: <20240711193749.2397471-1-tmaimon77@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 13 Jul 2024 14:35:37 +0200
Message-ID: <CAOiHx=kr=_-ra392XH-vR2fG-E5ZVXAutU9OP6xQRrzXSu9ZWg@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] pinctrl: npcm8xx: pin configuration changes
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: linus.walleij@linaro.org, avifishman70@gmail.com, tali.perry1@gmail.com, 
	joel@jms.id.au, venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 12 Jul 2024 at 02:48, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> This patch set addresses various pin configuration changes for the
> Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality,
> remove unused pins, and improve overall pin management.
>
> Tomer Maimon (7):
>   pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
>   pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
>   pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
>   pinctrl: nuvoton: npcm8xx: remove unused smb4den pin, group, function
>   pinctrl: nuvoton: npcm8xx: remove unused lpcclk pin, group, function
>   pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
>   pinctrl: nuvoton: npcm8xx: modify pins flags

You also need to update
Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
for any changes that affect the device tree bindings (e.g.
adding/removing functions/groups).

Best Regards,
Jonas

