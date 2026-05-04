Return-Path: <linux-gpio+bounces-36083-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NKTNMTF+GlQ0gIAu9opvQ
	(envelope-from <linux-gpio+bounces-36083-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 18:13:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7518A4C13D6
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 18:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C594300899C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 16:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FB23E1CE4;
	Mon,  4 May 2026 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+s+KstR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1CB3D3008
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 16:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777911231; cv=pass; b=J93nf8dXNVEFyADFSQ6ob4S4ONTwgHZ3vk/hsz/8+XnVF6oubZG5om0oUuhru5DAbQ7XcOv2Axd+/yIDV3AZQ7JainkdSViiHbdpkXsf0F5fcTNmpG8yUDTQIHCyccCZdW/8kldYhTb3ZK/DtefiaIdAcHhO5TmlHSargcUoBbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777911231; c=relaxed/simple;
	bh=grQPokDiwKkKR2cC+qIpUFc+ziae3fsVthjPxy+WT4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emQU+wJFd0G+nt/m9uqVhs1aJ0oAgKiIAWOotPtWPvC8PNxSBufFfWFKLMu3GrA1pBFSKWlibbYVmDiTw+fZu1UYiSDbm11z93zfXpcla7GmYb+srphSAEK0itsbShnf79hIrzwgkNlRFk9AutO86XFGZeiRr/bYmGG02s4gAWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+s+KstR; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79ee5037d44so57859267b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 09:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777911229; cv=none;
        d=google.com; s=arc-20240605;
        b=j8MdzuyRWRx3BAWxqAiSevHZ+fXkHqwhbZeX93yczmvy6MINL7O5rlF7XcpeGTto9M
         UMqJ0jtqDO44CziB+pl3SD2s3e5PnXIYlIWS3mXofuUsUmbvU0nkGUPbyU69x9TdxsGb
         xbfGTqgO3lymDukaxmFpFWkdIrjqaXjVosfav7EF2Rg3+uexB3x/He/ecvOkSNNb7fP/
         mfuKFW+bpJlqPNsRQFSgMSWYzZispHnOqNCSbpn2kweH9Pdu1ej285zJfAmmjq6dFXFU
         spLzsyhLbUqCQh6qhZMZ36qHfBw79vXhmt4tDjqmhiOi4AjFYVUCKIrQeJhKGm51jNXZ
         ro8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aw1EJoGSTvPEmUW8dtUARkbi6z9e/iETAYYEQUh3CgA=;
        fh=lCdUrgspx37gSeZ2Dv8tS3h7I2EzvJnonNy3RcbqS74=;
        b=Zgvsvfys4i6VAQ+afQNjoAa8kkypEhKXxEwdBTNhRXme2IHx22JbW7M28wQUyAPk+D
         YVCfhblBrp8sMCul0bRj53QRa/2c2K0PRkURaiRp3SwXmfZl5sKQwKnsk1PgNfx+SWjT
         4fWiiEEQqciUU97Fz+/7mUEJXiuCMy+6xwtBUgjFZ/htFkIEtwyNnGIHubGtJsY75zDD
         5vkckwK0ih6GRJzwN8tZE3ZKQuIUYPi0N/3P0VLiI4BoHbgTj4JIj9ObHOKAeAOs3qMu
         RA2wL+EMib22SQSFJK5xkSpKnJsnyfh9yjPcJTtJqNn7WzeboJ2iBCQE598Qu6rKfOd0
         38PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777911229; x=1778516029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aw1EJoGSTvPEmUW8dtUARkbi6z9e/iETAYYEQUh3CgA=;
        b=O+s+KstRxIQPHEUQp/CQ5zQm1QhkucyyyhCoEONdE2Z6KoG5XlBGgCP+Zy6lulc78P
         jKPCbiD6/exeAQ17GIpyonQp7N/KGfE/ix1kwlW87DQF048UzWw4Ri9vAwwfNyuVtR3B
         1UJGbSvR8KL84Ct+h4hY6MklAaPhARvW7PjlMhD8U3WJp+8y0GoPueES7AZ9944B+15m
         CZZl3N9/N3oKma8n5xUvAMWkHP9rpZWu6nBkmBPpjZeGSViUv/OlgJ3Y6X75NlVcHkY6
         2MIi/WVBdUyQLs3TKuYu/liFoYAewxwJ7bHi0HHPYEh+CLf2tUWTAQhdeJ2RRKRVitX9
         BG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777911229; x=1778516029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aw1EJoGSTvPEmUW8dtUARkbi6z9e/iETAYYEQUh3CgA=;
        b=PwVwiD0PJzXDvNJhxGBYdZUEf8KpA3LzmDSip/00n1LYAjV0KpJoQzZaQNpzDcJgDG
         rJtrtpRUuuqRNA/bhQTidN8tk6BZUB/zpEeLQPnx36S3oTYG4/9mFOgLVj5mdP2j9avo
         9TbzJ61iuYof9hZXbmucLM8JvDEsYJ94Al/Fw5ZLqyQE2rN9jcFkFol0H/NCFf8PbPEL
         v6vuaX4OBK0VG2tgs2RNZVzNyjoowXXl1k3IMMODRnOvFU5g94K7+bDiZZswN/MOh5Sj
         Qe9z75ZAwSK4hb2NaTXpCiFQDnnL6KsjaH9wFyXh5Jt4gmilM1LtdF0Wdklyy0xp0165
         Jf/g==
X-Gm-Message-State: AOJu0YxbNaxNbwWEwlkQgzNrboqQR5yikcVvgdg6UlYBM+Fwq2rWr20M
	BBtH4al4zP+e5UgdKPt/uoz8EZu44IAwrahp+ZPrue9x+qMZ8P65xTJi0hMY3e2pIaK3L8ijPxp
	f328ClQR6A9fCR3iHZW8OdbboGgHiPpY=
X-Gm-Gg: AeBDieuSUAhuPhykKy4zrUZ9ZirHfbrUFNFGKb1GB67zJmZqtDvMOSCR1cg3YLtSF/T
	3Hl43Z+vC9NA/P/eDULHP0oSavyTWJnsYZqRvbfjxxCn8WjREizoQO6lBbTfP/i86IHuUmmHH92
	P56favLdJNYkLZQZNdmKiKWL7NutaxB0K8bGFjuTYoWWRnK1AnlM14vkmEOGPU8vLcMDQfRDrpj
	zzYsLoRFFgUwZbclsZ0jiz/XUqm7U/pxCmzJK7ps0DxQHF6qqONHpddiI5hFETdBp9/m6vF1J1k
	BVe4GUWyFkOfGl4Ru9za
X-Received: by 2002:a05:690c:dc6:b0:7bd:76f6:b3a6 with SMTP id
 00721157ae682-7bda893b844mr2026677b3.3.1777911228923; Mon, 04 May 2026
 09:13:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503190016.13439-1-zxl434815272@gmail.com>
 <20260504075036.12190-1-zxl434815272@gmail.com> <20260504075036.12190-2-zxl434815272@gmail.com>
In-Reply-To: <20260504075036.12190-2-zxl434815272@gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 4 May 2026 11:13:37 -0500
X-Gm-Features: AVHnY4JDtbQyDHV4lFMguikU8ySIJc08NyGY4EMZ3ERTXO3Iow37nDmmugzLn2Q
Message-ID: <CAKqfh0H7BzdxYJr3bQbymrh9ex4q7fLcCbGEkp3HPX++pJ-XMg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] tools: gpio: validate arguments in gpiotools_request_line
To: Zhang Xiaolei <zxl434815272@gmail.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org, warthog618@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7518A4C13D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36083-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Mon, May 4, 2026 at 2:56=E2=80=AFAM Zhang Xiaolei <zxl434815272@gmail.co=
m> wrote:
>
> Add validation for input pointers and number of lines.
>

Perhaps make the commit message more descriptive?

>
> Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
> ---
>  tools/gpio/gpio-utils.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
> index 176bccfcccb0..930a38fe7911 100644
> --- a/tools/gpio/gpio-utils.c
> +++ b/tools/gpio/gpio-utils.c
> @@ -65,6 +65,12 @@ int gpiotools_request_line(const char *device_name, un=
signed int *lines,
>         int i;
>         int ret;
>
> +       if (!device_name || !lines || !config || !consumer || !num_lines)
> +               return -EINVAL;
> +
> +       if (num_lines > GPIO_V2_LINES_MAX)
> +               return -EINVAL;
> +

I'm wondering if we might want to use ERANGE here for the num_lines >
GPIO_V2_LINES_MAX check instead of EINVAL.

best regards,
maxwell

