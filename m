Return-Path: <linux-gpio+bounces-32744-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCsaIGoQrWmBxwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32744-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 07:00:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B5022EA1B
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 07:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAA66301484D
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 06:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66967330659;
	Sun,  8 Mar 2026 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="gq3ljsuy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4433290A6
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 06:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772949602; cv=pass; b=p5pCibvxIEZ/OcVh8BRIJhcwzjaZbkzbvk3UlWwxLFeANvgl+4lqX4gzIoqsxGC5QKdPcr8MERbnmXCvMLo5zFSu+GPN2BYtX5iUL7fyzPQuL22w3iWDU4NVrngV6OtuqYVdDm/COMG0UIleYXuUm3nuIOvaLeKhJ6YV33ZyrDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772949602; c=relaxed/simple;
	bh=9EUtHOwPZ+AhaBRS+tyPj8l9Ae1+JBLJrSOTEwuX73g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bb3BbBHpGbb7WsVr/HqbwlIfcwtv1hUoqPd00VfAgHZq4uNgd5HioJnXzKq2AQ0GaqHZnCojoXeizvyLnnGliNuy1kHmCimLtiRZNzt63gIOsz9nsLTrL3yJVjCRG1mAa9xHu+yg/1cEBJaCoQ9MyCXBh1pKpVsy7s8T3Gbboeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=gq3ljsuy; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c6e2355739dso4327283a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 22:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772949600; cv=none;
        d=google.com; s=arc-20240605;
        b=UpNAprsDSKko1gN/+RYuCmuXkIfO4r2hV5nxDVho+v4RgFDb/0sWbhn977yo0v/e0R
         x9/4pPXWgKblqokbLGA0IzF1+WdmkrTquDUns03KMHduKF+o8ZYooHGCWtMDShq4Ya1J
         TP8v6bH/TZUZpZd0AuZDgzC3YUx+9Yxy0N7R9NIPVaBNAsbV/9uxg/HpSE89sZ04+jvK
         QrYE9X5fPnUZYnNXSPbkTCs1c24DFNhFe6EDZijvzXa/4VvmhoVH+pyO9pgkEXG2IapV
         EkidlFifQMHXrYrC8/DRGahj+gOU7Pzmys4kv/0bfCrsl2o4uP+5icDLOV0z5wmZJMTf
         joMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9EUtHOwPZ+AhaBRS+tyPj8l9Ae1+JBLJrSOTEwuX73g=;
        fh=jqR2bdYlftjiDfur/Zv0mcGXyUGNK1HoMDZBqMOMt9o=;
        b=LfSx3fPHA1vWbGfM5RtVjrXxngCGezjxJnM49oM0zp6kC+emsnIW/K9uxTXrmBdcUi
         aZsKZ+HBLBZASL8/W6VSgPHqk1aJKKKN8M9hyKkSnR8HxH9m0QOt3oGFvFbyiXPKjh08
         B+iSykVZGjd+Gf+71JnlqrLxLU/KHvsH6i5tCWejzR+3rn8dc71w3nmG3JbWBWwUW0Xi
         05h6mbnQ3UKeQ6qXAZmrlp/Otmm5hM/dMYRAulpNxGPSfCOdX3AxaZY3pnBqAWpKt4IF
         H6ZpizZ6kCubApr5I2lb74BI5jhPHoVLBsHYBX7a1YDO50XelAZsFth6AvtVfTUOXosf
         BWvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1772949600; x=1773554400; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9EUtHOwPZ+AhaBRS+tyPj8l9Ae1+JBLJrSOTEwuX73g=;
        b=gq3ljsuyLAbqZJ01iY4HmTpHFzDT7RgCCZ18L/jRkneKA6+Lej9J4OskLJTXcbkSlQ
         Mwd+YzhQNqI5MGQnw6fOTtJeYEOwV95EudiUYaoGLI2TBQmLVpOBj38VF20ZX5WyNqJM
         lVpr+Y1cno+ALPnkZzBUOKvz6otjR3w2FVqS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772949600; x=1773554400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EUtHOwPZ+AhaBRS+tyPj8l9Ae1+JBLJrSOTEwuX73g=;
        b=or9Nd/O7lapAo6Zbj6OTLtvIhRGQ0w1Moo4li5T4nZ9Q7+q5NPO+2CjKESCoHYBQ8h
         R97RcK2Tz8boZO97SeSikahJxkhQpv9PoElYa6te07MAfz1/XUgJRcI6mb6NG70RQPIj
         /n9zyMccfzW//CaAHDpQDlPjmsIgaXULvVHk3biMKT6BqSUVp46D8aEG8RYzzgcnrAYF
         7IViWWHipO2Kur96KlNHOWH77WqnDjbX+gKh+E+sEHI8wVrbF1cXaKCiOZ09Nv3PBih4
         emOypowA1LFduSAzJeJUx81QVuiZVCaX6P8IMdrzjgGW05a8uvcN+1AfacZMZylmaDkH
         dgdQ==
X-Gm-Message-State: AOJu0Yz5QI2zA6FEkXMrSP9PDWQc8BC99aDEyG5OUd653QCVF9ByOaxX
	vbY4BtRtXUxIaGXN9510GMBs6sfxhTlGQ/PG2NMqF84kuKasUR0TsakpYRHPURNnuElZDjo7OVT
	WVNU3WH/oio2AzERKDOQ0I0yOv+KwaUFJcRLudLY0BQ==
X-Gm-Gg: ATEYQzztvpSf0qOrg0ohXnWIKhVSEpsKyayEsQzZAD26p0vOGzutgr0o4GfgDNskf9W
	MEvySovmajkIXuQ5IXOZupJRqgXFVC8zfnnfwpjTO0GFsZ1jmQUlOGH0YAIrw9iQOEjBtmzwu6r
	eRTTFjnUHrx3RVGGznMefE8ZnEGlab7tR7bsBbFzJ4nQTBN7ZweL87X+6//zdtA46LS0szIZWCs
	ETsw1pSxLDLX4GAvPEtu2dmRctrCxGmuKXNX6fOVsrpLSVMg6o07E4LU9eeD+xZODGw/EQfbbpX
	/au4m51/Uw==
X-Received: by 2002:a05:6a21:3b4a:b0:398:7796:ddb8 with SMTP id
 adf61e73a8af0-3987796e0a2mr2084371637.60.1772949599725; Sat, 07 Mar 2026
 21:59:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com>
In-Reply-To: <20260308021535.48098-1-rosenp@gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Sun, 8 Mar 2026 14:59:48 +0900
X-Gm-Features: AaiRm510gP8H23l1I4hc-O8_tv8pfmPKaxxv5LtBLQP8FXFHqw0aA7QhpFGe49M
Message-ID: <CAFr9PX=Aey-NJwKZkfsUKFWbQqj63eK68qAoLW_dXmPAnUw1KQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
	gustavoars@kernel.org, Romain Perier <romain.perier@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D3B5022EA1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[thingy.jp:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[thingy.jp];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32744-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,lists.infradead.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@thingy.jp,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[thingy.jp:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Rosen,

On Sun, 8 Mar 2026 at 11:15, Rosen Penev <rosenp@gmail.com> wrote:
>
> Use a flexible array member to combine kzalloc and kcalloc.

Thanks for the patch. This looks good to me. If I get time I will
build and test this but I can see why it shouldn't work.

Acked-by: Daniel Palmer <daniel@thingy.jp>

