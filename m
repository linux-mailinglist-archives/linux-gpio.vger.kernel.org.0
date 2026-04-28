Return-Path: <linux-gpio+bounces-35651-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMCDEKZt8GmgTQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35651-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:19:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9708647FDE0
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AFD6309E2BE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05EB37BE70;
	Tue, 28 Apr 2026 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jepGfRi6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7389F37F8AD
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363731; cv=none; b=MM61UqmTj+rZ2c+1DT1vGFUf2sKdKvUAl/GZor5Z1Kiqc+mbp5yCiZymjSsz2Yr9lN9raN+5V+2EQrf/8U6bacJ42B6ChO6eemMQvi9aA4XRXUIoYyNNMyDsZdY+6kdqS9uGK0wdkIFmL4zyQhpQT8GBsUipVdhAX+yiqYgrHek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363731; c=relaxed/simple;
	bh=8WckjIGBpN8uweObFU6ZpNlrFPmJCuLAesHgfKGWP8Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6hXHD0ChOuNmEFi/6TJCAaJH0nN+8qBUxs89PTheV6CXNUWnwhX6MYfkotncSodjc+en83geqtkmhSxwd93gPzb2+c9ADvM1H2JHqBVFEtUemskOfVHuU4EZSQVn/LVSlzDWYNvdZSRYVFRtSbbbb/GMQMo9q/3DwfPwiRgdgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jepGfRi6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785C6C2BCB6
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363730;
	bh=8WckjIGBpN8uweObFU6ZpNlrFPmJCuLAesHgfKGWP8Y=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jepGfRi6IhY/3zGLVb6usMUwKJVv4r9hjApXRjyHUIXNJansjuRWFWqu/ROuE47HK
	 ufasfbci967aYKTzs8AGA7P6h658HfbYjX9ZOGG8axLRha8hLhGkpzAQ2Z5uBf+spC
	 gXqxQg7tzvOB3PP+dPY8Aiev2n0eTcULr7T/SvoZLJK6WgrftXAAQJUbsnn8M6FLLY
	 b/jcZDxmUPtLaVbOQzykoLVpzK07zboSD/0DtUrDu90vImr/Q/SVOQ2U2hq+ynu+xq
	 sb+WmRaueS0UjmPesExixfG8DgePDvfB+LnETIpIt1DC+Ir37WiMQIG59HlysAaFz6
	 a6aRjMMbpU/dw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38c620f1699so97513391fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 01:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/JxeblG0od2OX7Pr+rTCOVFdYaMdX8a3aW94YR/ax/7/W+4NTNmYijOuNDWc7rnSrb3hJamrr3rfCF@vger.kernel.org
X-Gm-Message-State: AOJu0YzakD4xbiTj0YKoZ1F+VsfQNq/jY+BN9vxUVQDtiZkrcxpTqIT7
	hqraxYBxKlFpfqj3RsuQGspUewlX8EAhudlm03Fc4OoV9iQtb8IMxBVGp4TL3MoT+BWGBcCQebV
	uepmCDlcg8Ncu3qDAp582KIzSYDDO+wlgRH/2FfSngg==
X-Received: by 2002:a2e:a590:0:b0:38d:fca1:4a6c with SMTP id
 38308e7fff4ca-39240fc94e0mr7301931fa.17.1777363729159; Tue, 28 Apr 2026
 01:08:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:08:47 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:08:47 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427143020.2800317-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427143020.2800317-1-arnd@kernel.org>
Date: Tue, 28 Apr 2026 01:08:47 -0700
X-Gmail-Original-Message-ID: <CAMRc=Med9Uph384ULUyyU+CDFGm6MfLdv5RU_wirr12p8=pPkQ@mail.gmail.com>
X-Gm-Features: AVHnY4LY46ocRRPnvuEcEfnfO-MExxALHfh8FrBE1LiHDloCjMtkmNNOXHQEo-M
Message-ID: <CAMRc=Med9Uph384ULUyyU+CDFGm6MfLdv5RU_wirr12p8=pPkQ@mail.gmail.com>
Subject: Re: [PATCH] dsa: b53: hide legacy gpiolib usage on non-mips
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	Kyle Hendry <kylehendrydev@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9708647FDE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35651-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,vger.kernel.org,broadcom.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,arndb.de:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 27 Apr 2026 16:30:08 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The MIPS bcm53xx platform still uses the legacy gpiolib interfaces based
> on gpio numbers, but other platforms do not.
>
> Hide these interfaces inside of the existing #ifdef block and use the
> modern interfaces in the common parts of the driver to allow building
> it when the gpio_set_value() is left out of the kernel.
>
> Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

