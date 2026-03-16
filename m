Return-Path: <linux-gpio+bounces-33461-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBnxOUTIt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33461-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:07:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B0977296B2F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50532300E598
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB78D384224;
	Mon, 16 Mar 2026 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRp6CkNX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F638238C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652001; cv=none; b=bmm97muExQsVRupPVg2CvBtzEY6AGBx7WFAWd5FWxW8Dhiq3BzA6n1q5ZBXgBNy6LiH+y9nBcPrFaIwvhHudTpMCvPurq9DFdfW0M5++JzlnAKFXp5kL53jOiHDxkXt/E6GUOh4z0fBH2AVOLxr+qhzz/sSo5b4x+33MvW6NtjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652001; c=relaxed/simple;
	bh=5SE0PmFO6g5N3FpnWF3NnhO0iI24+crR4LB9Dp+rN1g=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRPkgi+28MR4SH1Q6CrUlFS2HRvdRHU5aFdjno021u8w1HNUdddpqH2FZAsIGxDbqWsfyRizmKcB0cQXfBfi6MGcAoNgQ465T3ZYq+hjTCaxuZSzbCfKQQoXHUxiOQB3SkqMUeQ1QSRzay+cpmpKG1MqcjD00lKcip8QwEmAuHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRp6CkNX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F2EC4AF0B
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773652001;
	bh=5SE0PmFO6g5N3FpnWF3NnhO0iI24+crR4LB9Dp+rN1g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=sRp6CkNXQV12WCb9LN5BXTPngHPzqVKLw9PCkWHb5i0DNM4PFroO1kr0U3hw3Y7+7
	 GfKmPOYRp3+2gKIjnbBQBG08ul86GifJzng/+2YADWRFz/9j3cXTrB/w36YuBwJy4G
	 pD413zTqauSpqdWKxyVbjnw7ScSxuIEJVc4BHk/jhRvWfAszS/8Wc6qXaPtpgPTIg9
	 JLAeZDB6aFWvtzxXJdy+W+vwmorNTr6zXiDccge+LtJfn2pZxeSovpLeD7dP+9jNcK
	 +Z2QDmMkDs5Dzbse/22cRUSVsQ6IHeq86F2j0W/mxPTYWv81mhV8LqS4n4wG/ffNaf
	 ntJ1ML3rHRMgQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a13d1c6f25so4461585e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:06:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4WNd50TrfG0aoydqHFXctaX3Es27otZnERt2hQN2TMfSQ6k2/E6rfo+59OZ+TkIHKfl95GI4o9Tyy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6WSzZeGbjMVawhZVuhc1VN9Xk++r2gpKIfqtQ4rD/K+b80LNL
	psl9OUZ7AcaQGFV3HmnclxAhyx86bXA1WcO/rpgS0MCYaM0vbRS45DiNe3926vvW00qo3l6Fjq+
	I2VqdgQHMgnac+BKuFxHeO42Vmo/uE97Qki7q+daMuA==
X-Received: by 2002:ac2:44b6:0:b0:5a1:4f87:27a9 with SMTP id
 2adb3069b0e04-5a162708d47mr2981302e87.21.1773651999876; Mon, 16 Mar 2026
 02:06:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 05:06:38 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 05:06:38 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260311-mandolin-sprang-9b9bee9f5a04@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-mandolin-sprang-9b9bee9f5a04@spud>
Date: Mon, 16 Mar 2026 05:06:38 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdOpUEw46xSFqw6Uc07XQtTBK2ikUtUka1gifGs0X5DDA@mail.gmail.com>
X-Gm-Features: AaiRm53OhC2gDtqTw6o-dNugtNcaIYKHiGgTsAd40UWkKJImg6KvRVcf1Dd4fT0
Message-ID: <CAMRc=MdOpUEw46xSFqw6Uc07XQtTBK2ikUtUka1gifGs0X5DDA@mail.gmail.com>
Subject: Re: [PATCH v12 1/4] gpio: mpfs: Add interrupt support
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Herve Codina <herve.codina@bootlin.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33461-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,microchip.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0977296B2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 16:17:38 +0100, Conor Dooley <conor@kernel.org> said:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add support for interrupts to the PolarFire SoC GPIO driver. Each GPIO
> has an independent interrupt that is wired to an interrupt mux that sits
> between the controllers and the PLIC. The SoC has more GPIO lines than
> connections from the mux to the PLIC, so some GPIOs must share PLIC
> interrupts. The configuration is not static and is set at runtime,
> conventionally by the platform's firmware. CoreGPIO, the version
> intended for use in the FPGA fabric has two interrupt output ports, one
> is IO_NUM bits wide, as is used in the hardened cores, and the other is
> a single bit with all lines ORed together.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

