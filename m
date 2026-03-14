Return-Path: <linux-gpio+bounces-33416-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPl/E30atWlZwgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33416-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 09:21:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A47A828C18C
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 09:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2297B3032061
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 08:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914402F6192;
	Sat, 14 Mar 2026 08:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="co3cYosh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B42DB787
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773476462; cv=pass; b=EN0zhIAMcO/N3Mwcc+OvIXhJCBwuii3vCvWt7k+4BtwGMqxRLt7hTy4T68HxMCKWrO9iInl96+ZuebU+/zX5IJ+H75XF2v8qFX1by1GXQYXhyt1wSNI6LPcfo8PgTUljen7VJryMnr4VErLsHJnPZP68GfXAO2RU6fsfN7k8iHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773476462; c=relaxed/simple;
	bh=vlKb7klkqu40FzQ6yrehhV+k5I1Bpd1t4GCy3P/aJDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQA9AXp12QgpmrUjBw732/p11cuKfoLYs0K/tx46kB+cQPQlcvG9hhdmQqQqeN3qKvQwl3FJ8OYVZnsgwgisHdaFmKJAQTrZixCOGWaOXB33t8hV/ebSlLgqmTmjVVchSTlsqVEB0mF+nO0SVVW8+ykUny7eYucx2UW+e4owcvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=co3cYosh; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so392202366b.2
        for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 01:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773476459; cv=none;
        d=google.com; s=arc-20240605;
        b=Nnj315r+l627YI1ivKe9WScaXkpuBSX5TWXZ1iKdXbZpJ6N/OLbQgGW+iq4I+L2VT0
         GBe4JpdMkW9yLjP2VOXBoxIMn1jLj+66T3+kCBQwB2EHdlAJ72dA3ZOUnF+ENZZ5EfAE
         79YFWrVD758QyFtBIdAKx+NIL7VyWlUUX7NTlbyY4UzjXVEX6J1UV/88PyQAQ28n7ro/
         18XslmO0LFhDqmlJD/jvrR4kzPz8eCNjhXM7la3adZSgNRRTLyNsMM4SkdaN99o+jCg3
         itXRdgJh15ZxlB/u56eyhc/h6nyqgniWIvNG4NYeTirlUoj0Ycg4dpDHUP81B1NLRjWL
         OfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vlKb7klkqu40FzQ6yrehhV+k5I1Bpd1t4GCy3P/aJDQ=;
        fh=+4QYYtVFPK57cgBLqeXHbjJH3W2fyznLrCLeBttczCU=;
        b=VKdj9SxHnYK8vwnMOk6h5IvPP/YaTIfiwTcOcRhOVccs72LjGUFpsxCDv3fs6KaA4Z
         eP+eKkkvvQXvl+vNS6oY/o22HtsXT6RM4DW4BZmoxiNC3HnQQOGACLUE6Wfqh4uQjEiO
         1rtQGatZphHp9K7gr0uMO3UyyDmTYTAN4A9jrTEc5YR/9PzGLlCKXiEQElw/Wd5NTBGW
         fhz9ZbINjZmmi0G6JS42n5EFtKqYmy2KZJ1W/tFq1H+gXxt6f+cEZi24ORUtPh0om41e
         2eQzq6oaNg560fmJCFoEL0jAJ0GRP8xC3bYdvinJUyjizxItXLEuiZ73/eIqESIt4thY
         Sdtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773476459; x=1774081259; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vlKb7klkqu40FzQ6yrehhV+k5I1Bpd1t4GCy3P/aJDQ=;
        b=co3cYosh/BLt61sqHjI+FIRrkkYN0K6PDvEN7eEgCUu2VW4GWCP/uo7Tf96Ds27P9U
         0e2RiXCqjCBZmd/KeK5/gDnz5Utej7kiGH1VhChbSlSfvwDCIPJEAM/W1u2tnZ9/K8qV
         zhgIcvomrultgY5RxRuRSHf6U5l28FEMeMmOVA+1KZ/6s+XW8G9SqbkXR7C3TITvogv2
         5WTkqRH0b8YcCfCe1bn5BJMSXQtBLoBnx3CTRgZKr9GIF9lfB1CaoG4U2Qi6Flp1PLx3
         CWMb5RKqPeoK3icTtlYJImJPzRkoezF3tMfFnwhjkN28fxAhEKLCnxHKoc42wjEn+1/k
         VaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773476459; x=1774081259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlKb7klkqu40FzQ6yrehhV+k5I1Bpd1t4GCy3P/aJDQ=;
        b=CtajGrI+3UEofDwRGDUlajivW+gtAjMFhRJ0ihda4CgPnawqBo+LTk/q37JdUfc9Di
         XjPtTrLUpOHQwO4NEJ0pY6aIuO0NHZ7c9ADbokj1NxMG0XQPzNSktRUOIs7UvlZMilN9
         3cXqIhnVHx6sQqDXMQUCyb1jYgxlEUIJHrG1haxHg0vnBIg0TdOYlovUw4KBJUWbTb0u
         qnNIeSpZEK38y2zULmsuzUNdHz8roIJWZkciIgc7uYTZhSamjVEQEDZbBDMiRhVPfG5B
         XkCWUW5lW38LZ9mwtLoL1R03as6iL/cEnAD+67QAzqwNeTrWNBU3PpjbNUMAuIvt9yta
         OSrg==
X-Forwarded-Encrypted: i=1; AJvYcCVYqugJM8/nO12cqScqn1wpLRUEzahWbZACABfYRAKc672vPW9hQE6XDXaHj9H01+POSKzYzeULYhVs@vger.kernel.org
X-Gm-Message-State: AOJu0YyJF5teCpveizWbGOPBETaqW40p2rpyzz6vWDgEhPAByB0735ja
	CNfFL3wG4MVgcEF/aAAC8BAHslzovfcp/UVxpzIsqu894Ost7GwsCdI5UBhg95ghJyzmT2yj1jk
	rWqkrJqZqNH+SMBNJGzEi/q3K6HjiS+nLLQ==
X-Gm-Gg: ATEYQzwXuUID8WS9SNEbg5z49KLx8BRhns/rcivhAD+4X7cEhhJQDAKbk6ayLvGlHQa
	VQfhVlLwfHXZIkUCKzrL0AqVGH1Kvadv7UsUQMp2GptgIvtYZt2OMp1bGQtoRDV6Y2G+zQUdMNV
	WaMnaJMuXc5/Z8rrKpjppcDRpOer64qKc6nxofFDiz5ildT5gat8UmatpoEky2omOZ2H5Bg8Uvd
	MXv9Hf3z/F0sIiRhdctscDoeENB2qcx2yK3xGKMnSfvrwNswa/kbfW5/HDYvEXDJuokQHggpUOa
	hqoX6xzMsnLYmflp
X-Received: by 2002:a17:907:c305:b0:b96:df8c:42cb with SMTP id
 a640c23a62f3a-b97652124b2mr305792966b.46.1773476458945; Sat, 14 Mar 2026
 01:20:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech> <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 14 Mar 2026 13:50:40 +0530
X-Gm-Features: AaiRm50vBOSwj4szvgoweRvqZZno3gW1jvqc0W3UsBDtZwZjhBCmdc4MEYz21_c
Message-ID: <CANAwSgQj62=2VFxpUKqXiyNfP2vpPBnB-p_k4_83L0mMQ5oOPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit-k1: Add set_config callback support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33416-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,pigmoral.tech:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A47A828C18C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Junhui,

On Thu, 12 Mar 2026 at 14:14, Junhui Liu <junhui.liu@pigmoral.tech> wrote:
>
> Assign gpiochip_generic_config() to the set_config() callback to support
> pin configuration through the GPIO subsystem. This allows users to
> configure GPIO pin attributes like pull-up/down when specifying a GPIO
> line in the Device Tree.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

