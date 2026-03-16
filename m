Return-Path: <linux-gpio+bounces-33524-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGtAGAwLuGkWYQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33524-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:52:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0493329AC76
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C40AA301BF76
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 13:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF99E3988FC;
	Mon, 16 Mar 2026 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNZ5VjQO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF53395256
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668906; cv=none; b=fm6Smcw1zk5jf6kjwZ0N+o7gli7hZkxwXL27KpvlUUs7DE5EGUgOkq2DwqcWdk5R+jT9TDhTYfEXuB264B80pEucYv2J1v0PLBLMaG1RpAbNAAnZgMt9Qh8pD8AXNLfvNhywFo4bK7Wv5rwhYj0Cxy2+6mztiwQTqtzeLJ6lnb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668906; c=relaxed/simple;
	bh=29u/YwWl2Hl+YGd7rzZ2lo2oPDlodQX9sQOsuio7m4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ne2W+jaO2DOdZ6K7cpRvrSvwF+zIjqzsfCHt3hzgaPkEzKDLFntrZSnDZt74LOW3emF/h51R6UH7mg6S+pCfJS83gkL+knipPQUFg3QhEJ5GznN40FMxdwQXbKd7ejkD9RCHmzWBqDQlKCvUVrephZJ3mQFJrAuzSwMnLLBg6Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNZ5VjQO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C350C2BCB1
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773668906;
	bh=29u/YwWl2Hl+YGd7rzZ2lo2oPDlodQX9sQOsuio7m4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oNZ5VjQOOeLfTyF61rXT1OTdG9OWuy2s7kYKcf+oY2qj7QyW2T2Q55GULG1rA2ix6
	 XhKlIXbcGaM+FGloQob2PDt33JD9LXxiihJIqYTMPSSex/qUajvxtjuaep5F8l3I9a
	 aJX9WQ2fWm9JtxDTS6+GO+XqNhA94ojNDzH09wogrQbNgxUEbiNf9C2kbcsJRz4ctW
	 3AS3k25DWKvEI1DlbQmxYeAO8hY7TYIFmuf6aplmid/ai/JmvP0YXrnkZge3BuZU6G
	 ssoR1/f25c+MdSx5czpcjnPTZoj7UzzZkOLyxtw1vfmRu6CHbtoVMkuFhNy74qOyrh
	 ioEvMsYDRTzLg==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so4369553d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 06:48:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpbIJ2vbXm2+j/5T3mYNAD5Ei2Q47BCKbKbVE2GKeZo+p9pwXeUixRAUUY3qIimqgmjfWewwvToZ0f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Q88Xy5Qsjt2h3B1T2D/RHG55sO+x/ZQ1Mcjt161AzTjBRqdQ
	9O8bdHKeIO4H/Tr4aurUgq8wZlJiMT8qjb6euc3zD7WKTxTXoABcW2AoRlXa9ik12FOa7gNmwDW
	l3cDCy1tKyYW7SpCJIGZ2w5zecMhI/Cw=
X-Received: by 2002:a05:690c:385:b0:799:2b4c:1d49 with SMTP id
 00721157ae682-79a1c17a01fmr136295397b3.36.1773668905744; Mon, 16 Mar 2026
 06:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312113040.68189-1-eleanor.lin@realtek.com> <20260312113040.68189-3-eleanor.lin@realtek.com>
In-Reply-To: <20260312113040.68189-3-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 14:48:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLmv8Soi70pJefMg1EcQ_6rR2HyYPzSd-=aeTH8S=GGZUg@mail.gmail.com>
X-Gm-Features: AaiRm51g5iKD4Fcca-uqHDY_L5ulx_Os5N5cONdMsdXj4A_yltz8H03U9SZCBfo
Message-ID: <CAD++jLmv8Soi70pJefMg1EcQ_6rR2HyYPzSd-=aeTH8S=GGZUg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] pinctrl: pinconf-generic: Add properties 'input-voltage-microvolt'
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33524-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0493329AC76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 12:30=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add a new generic pin configuration parameter PIN_CONFIG_INPUT_VOLTAGE_UV=
.
> This parameter is used to specify the input voltage level of a pin in
> microvolts, which corresponds to the 'input-voltage-microvolt' property
> in Device Tree.
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

