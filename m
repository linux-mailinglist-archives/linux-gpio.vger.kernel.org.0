Return-Path: <linux-gpio+bounces-36196-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ITfEPTk+Wn2EwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36196-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:39:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B384CDB1F
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D038B30CCF46
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F7242E011;
	Tue,  5 May 2026 12:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4Fptw6a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A593A42B75A
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984422; cv=none; b=jDEq0TlYcdEKrSbZ0SzXPY+1YGmUERTbM7afTx0CYNJ6znn4Bc43lPHN+xfNcDJPjLA46KQlRIlh4xFwqkZyv19YeYrHC1yE/KSWBlJCyVNxJgn34cDuCw7QiqqLmXL7ORLW+VmbdqjLGDNgDgZJbeU7LQ0+tz9D+Ot9cyPRU0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984422; c=relaxed/simple;
	bh=gtWGscUCzGn1VCzo0cxRdk9QlZ1rTV0jjyFSOsBAMUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdZkF/k4oexFDX1VQjDeHIkltVXLaVyDZ6WoshyNvBXr4jtave6xwcodfLTOo+grrwQ1PkAFGv0dxE0QehIxjUtlgYIy3j3A3rToOV4t6R9MZG0cHWvkflL0SaVJAt06Fo1SfFtAlntbOdpBQuXdGi/41KVv/kmvMSsMt9/ZM/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4Fptw6a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9BEC2BCC9
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777984422;
	bh=gtWGscUCzGn1VCzo0cxRdk9QlZ1rTV0jjyFSOsBAMUs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A4Fptw6amnt1Qq3FYgN7JdksSZ84rMXbHiny17D8sHp/4e+0xvnvwv9zSlUU+HYVB
	 vJvOE2zXj+LhF+lkcA2WXWKSRTpT+TiGw+Vxfp3cOp9Iaew70DfQAGO7DuFkA2r5JT
	 I5og1BX/TRenQC7wNTmUO5dVHIKXQnaDOu/0yqRlAFh09CrlnT2c656X2vGM0niqlC
	 oLaxfQLA+pP7T6aBv+8m85LM9SG37c5+TI0h6g0rJt7Q8+Bt6NQiK27mTFHqUU6rLO
	 KPnuu5QiA8rxvWtJLllBUqtSwKQ3rn5qXXLzT84Uh2R5vnO1YM7/LJXpBaieNxdlyr
	 nxHyuFTp+dBVw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a525aedb24so5801339e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:33:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8L1VIok0ZSHgRmspWm2SjupbiLcczr9fWQWs0QI9tmUMCn2BdrZdVlIgFdaWa71sbt2I+jo6mKIn19@vger.kernel.org
X-Gm-Message-State: AOJu0YxKOP4IKhNdAKhA0J5X/WAM9uyA9XiD7ubOXvuo4ec2rJbY/3zj
	Y/1LpVj8Rf5YpxxOWVlXnsjzNahwMVkKRghYTY5T1wj1ajLUCIW5wDGUxxNQJbmaDibaqH2a6pc
	WiF3neTgC8cWfF/FMYzfbUJ8o1D1Em2s=
X-Received: by 2002:a05:6512:61c8:10b0:5a8:7f42:7053 with SMTP id
 2adb3069b0e04-5a87f427077mr927912e87.2.1777984421184; Tue, 05 May 2026
 05:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430162855.2029285-1-arnd@kernel.org>
In-Reply-To: <20260430162855.2029285-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:33:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLnfVdVUjq4zmZMo2Ycy7PKSmg2erna6fpSFZAJe1aaRMw@mail.gmail.com>
X-Gm-Features: AVHnY4KJJxeEA36U5ZTCzCEoK9BMI_iSVAY1amGH0OVVr8ZohzXVAV9Y3_lduCU
Message-ID: <CAD++jLnfVdVUjq4zmZMo2Ycy7PKSmg2erna6fpSFZAJe1aaRMw@mail.gmail.com>
Subject: Re: [PATCH] mfd: ezx-pcap: remove unused driver
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	kernel test robot <lkp@intel.com>, Harald Welte <laforge@gnumonks.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B0B384CDB1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36196-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Thu, Apr 30, 2026 at 6:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Support for the Motorola EZX phones based on Intel PXA processors was
> removed in 2022, but this driver remained present in the tree. As far
> as I can tell, the support was never quite functional upstream because
> the board files did not actually instatiate the SPI device for the PCAP.
>
> There are still also drivers for the various mfd cells: keys, touchscreen=
,
> regulor and rtc, all of which are obviously orphaned as well but can
> be removed separately as the Kconfig dependency now prevents them from
> being enabled.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604301209.f1YXTsIr-lkp@i=
ntel.com/
> Cc: Harald Welte <laforge@gnumonks.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

