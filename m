Return-Path: <linux-gpio+bounces-32533-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEukN9w2qWlk3AAAu9opvQ
	(envelope-from <linux-gpio+bounces-32533-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 08:55:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4518420CFF9
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 08:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E72D305B940
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 07:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775103358B0;
	Thu,  5 Mar 2026 07:53:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDB433557B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697226; cv=none; b=la2nRRgRAjL9nM1R147OtixJNLB87rAY243zzFsKvQDF3t283y5w/2dd9pBrn5d6C/DjbgX4yz0mTIBb559CuWgopRW9XLfY+ckko3R+8OUltJFOrpEYZO5R6EPpnv6RrDtrTPXCQw5+6cVEppDgYKtpP3Diy8MyT/jSnFUHN1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697226; c=relaxed/simple;
	bh=1VrdyW7eBzn3eIzcJ/qwIsXSzypVzRQDxfUgekinKYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKRPUAi/HMS9KjQZay3yzhwR65hD1wF2xCcW5rJNUqxVmsWES10EMfKob2eXauYC3WCTdzTLWUy7rQ4ZhcTaubNNIRFDTLftdYv3SkRC18XOd/6j3tprAe/0Op71Y0VhK2gr3tlKB0ihpSVa4TW6Jq7Vv7wIzoTx/HOT77e0Jr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cb40149037so804720685a.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 23:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697224; x=1773302024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=;
        b=W42WmUXNHIZv3W7nsYPY2JggW8AgLq2s4qprS5M3/XqdjO1rqR+ZHh0q4yJ5xvymt5
         aUSRvGt8EJMkozteGPkseOJOiA5npLkRNGDgheHmHczFYxnBqc1jDJ7GyIJQSzD/Z7wK
         JNvEggU/bPH0upZarDtPy+aEOyR2P5XnoE2qkvvxeWg819b6LwQclDrbrWgS5nn9giHB
         NkTysyGAjvDzPE6N8VA0dh8YZhOg+0FfuCC0Qvg+16kjQAHep0YHanVaEzj2pXPjFloV
         FQg3VTpXFijRf0AlwdzMgU8Xl1GuOjccBcdpo54YzHpMhV6HhkJ25ei8WJMvXK6KCvQ5
         o+zA==
X-Forwarded-Encrypted: i=1; AJvYcCV+NY85P78MtsFyLrTENFJaoYFEmLmgDxTSyUQU5xzfkYwXJzYpZP/blzQ7L223X4g6cRQlG8xe6mrN@vger.kernel.org
X-Gm-Message-State: AOJu0YxxWZ3+MPo0nBX7Rb6CY/QVmKoSTi0gutYFSQNlKP6xRj+VRG3z
	6x7d4YnLBDF7KILiG1PxCCz0XWV/ABvofvEn240ug2P6JtKZCQjRmYJ5ZJA5x/3Z
X-Gm-Gg: ATEYQzwEoKTnu5hqt/8/SkCSJj6elwDr8ck70Eco34yUzM04ui5Q4SjHoMWnBM9PMJt
	QdGoYf1POpzWLitCCdtjvFrQyyBhL0pgEWLXsg0Tq5BQvuqgoTZgaLmBg08yvXc1eY1dspIhnJP
	HX7yaUyx/UOmwB/Tqgq6hiOfdA9ZIEbILVI+wnfuPNOkYJt9QFDCtdENkk4ieKZ/RfrgqGRCRtn
	qaqYzIXXY3ItoRXONGtH04aAAztML7PwsCRJnJOkfhzIJApdyiwaSLtp63937dQeCogIbc0m+RI
	nPCy3mOC2lL7HHP4OhPyKZgbf6LkljL+dXFOiPxM4jAg8Tv0DyZY0MBWn4zNURY8RTIFRHh7GZE
	teUtBdrYmcm5h7uZqclC8MUcI8yWFueTCFxYCwFgkahF5AV1Z6PjmO7qSBrHPpxwtSdK16ZbAso
	WxLaLnPkk63LHON24diiqmgebNNyDz7Xkc/anGOA7Ud3aHXRlbOgVnm7wv7I6H
X-Received: by 2002:a05:620a:28c6:b0:8b2:d56a:f2f1 with SMTP id af79cd13be357-8cd5aebf16bmr573392985a.12.1772697223988;
        Wed, 04 Mar 2026 23:53:43 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf678156sm2032241185a.18.2026.03.04.23.53.43
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:53:43 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-899f79df682so47086286d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 23:53:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzPH/ZqNgWnbQzZGp4EgiFGzr9cKjs9w4x5xDBm8vAjTPoZji2YdcP+ywhPAJ8kfyA7O42fCALnXZ1@vger.kernel.org
X-Received: by 2002:a05:6102:441c:b0:5f9:3a22:85a2 with SMTP id
 ada2fe7eead31-5ffaac72675mr2059267137.12.1772696734612; Wed, 04 Mar 2026
 23:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:45:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
X-Gm-Features: AaiRm52ziEM93YxO07h7pOV0rTYZnULijxTOwLRm9EW_k_lOxLulmwK4PITV2jw
Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4518420CFF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,glider.be,gmail.com,sntech.de];
	TAGGED_FROM(0.00)[bounces-32533-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email,glider.be:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
>  drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +

For the Renesas parts:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

