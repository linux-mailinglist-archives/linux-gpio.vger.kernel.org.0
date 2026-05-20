Return-Path: <linux-gpio+bounces-37190-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGKbA8R7DWrtxwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37190-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:15:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 376DC58A7F8
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 146203018D41
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3743BD647;
	Wed, 20 May 2026 09:15:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731113BCD1A
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268538; cv=none; b=gxfhlYq7zXUVWuxeDNP8V09WErloSYKSu/61jEARbFdCYovwCplhFBbZoVK0mDizwx2UqjhyXIBEcy6Sualw/GCrAyAGDQyhO6gGEWL+wmjLXddgcUmwPZdNRyXd95EWH4KULGqQMkQExz7jSWJp98hvM/MI5mmXYdZkvsJztS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268538; c=relaxed/simple;
	bh=zIU4ayCbME4RrunATM6lGIZD6z0trKNPDZbjXjC0Kio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jz8pYLEF+3A2t5IgOmXJ32ARr0fijX8kP5saH9D81+fTjtt6S0in57OYilKAnBVKedB++nuEF9p8pKtElY43ZAA5jAZpNcU62L2/fGYrjSuHGnUXICDBlvkUnFSuMiyJYZmXf9/pGiQLiof8UktNJxWGd/xJyZTaKU0TdJVo/I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-575124e716fso1398178e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 02:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268534; x=1779873334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wp3pf5N7/zZnmUje2nacDRULdOsYbVIxW74x9vSM6jg=;
        b=i7fWZ9eSk1bAU7+I1xUvjjk62fz9O2qjWoJ5e4UDv+o7lKXGDS5p2Iy2cDX5v/Y2kM
         khFC2oTZZJYFdCeSnnucXyCCMTn1lA5D9HIHkIt8YtKtTYRgkmh+HYcRgYVHb2fQMBcc
         hePUuDDh6iMXvDbE+X6hr3EZewOhVS3+7FbMnrN5db8Nis3WQAqNVwxryD7RFL19lnhq
         0q/Z+z7K1ZAPRQD8IrcKEZX/cb8exzmh5Sp6769BjF3JGvuO1KL9UX0TrOGqXHaCbI+/
         wUdcPexrrFvTLSGEhh5SFwiEBAp8jWi75kj1VFHhLkwnmZ4iW962Ld6X+C09CkNBHiwH
         W1HQ==
X-Forwarded-Encrypted: i=1; AFNElJ909NOWVeieWJiyxHp7WlJ8ck9BT0FYEu17/eUZkFzW6IUd6/Cmfmi2rynDqLwgR0a1Uzg4wW0Mu86G@vger.kernel.org
X-Gm-Message-State: AOJu0Yziz+T2aBX3iqu5RfNlCdPaW6SQf7Rw6QGgEHaVfbHiBxDEKvOE
	uJzqHeG+4ymRhkqWHd2sjgMNvFu/rn23dBqNPhQ2vMkmZN2XqolXq1AdB1p3bU2ChpU=
X-Gm-Gg: Acq92OH6RsNiHOnOqyLtm945LnT+VLd5BTJASsJcLcPbEYIkT3KxIGlPx1tlctzZdko
	dTcuruD/S7tBhG8HN3H4+j63d84NNCCQcFeQigqyCgpB4K9+6KdaSASTsZ6N+NqxiBR/TOlL+WS
	FGQ1RgBRfE1XTKXEjO4a7T7ZIicEMq36jsJ4DsK4EygXywi7AKJ8Jz+/Ac4PvDdAbb7bx30SECv
	kRAzi1Jk2COhuZCzYf7mmmDfF6xAMMU/obS99YDQYvmh2MtmsHa5evBbbYrTSTegmr8AAs6ILDG
	uCpKntchhVbQLKqaqZtez9Iu65EHeoRXz/+jqVpkeKpeHWrL1+t9u5BFzWZ5Ojmw50TuihYIp5n
	6fofPUt1nZ+w/ZQ7+DY1PaqGTMyDSBL1TkEA+i9dCAZvIsXDioUcpcvzei+g2fyv5l23KwgJ3jb
	FH6Yq3ZyrPd26vOsI7ZordwqvOc/Uy/b1TBwM0IWtTnbqqGX+NRB6Nu/3ZtUlVmHNJ
X-Received: by 2002:a05:6122:e166:b0:56c:ce8a:b07a with SMTP id 71dfb90a1353d-5760bfb0c42mr12257693e0c.7.1779268534284;
        Wed, 20 May 2026 02:15:34 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2c99f63sm8165116241.1.2026.05.20.02.15.33
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 02:15:33 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57747a2bf20so1205027e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 02:15:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+vrg3v8hsZMz3rtaeyeEDM0BvKE35XoJGqx2nHehK3Jip+5NoNIrCDxx31L9O4OPP4F+pBK/8lw2Cd@vger.kernel.org
X-Received: by 2002:a05:6122:2db:b0:56f:31e3:9445 with SMTP id
 71dfb90a1353d-5760bc67b78mr9734937e0c.0.1779268533076; Wed, 20 May 2026
 02:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520084911.27938-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260520084911.27938-1-bartosz.golaszewski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 11:15:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZ=XUvJTGdDAjnkxgtw7Uvnn61iOy3XN_5XNZM2anctw@mail.gmail.com>
X-Gm-Features: AVHnY4IfFO5-KJ27dCfas0jRbpZDfp7KbHiXpWPNVC1kKan_aDAxM3f-0Nl46iM
Message-ID: <CAMuHMdVZ=XUvJTGdDAjnkxgtw7Uvnn61iOy3XN_5XNZM2anctw@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: fix a potential use-after-free
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37190-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,glider.be:email]
X-Rspamd-Queue-Id: 376DC58A7F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

On Wed, 20 May 2026 at 10:49, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> On error we free aggr->lookups->dev_id before removing the entry from
> the lookup table. If a concurrent thread calls gpiod_find() before we
> remove the entry, it could iterate over the list and call
> gpiod_match_lookup_table() which unconditionally dereferences dev_id
> when calling strcmp(). Reverse the order of cleanup.
>
> Fixes: 86f162e73d2d ("gpio: aggregator: introduce basic configfs interface")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -979,8 +979,8 @@ static int gpio_aggregator_activate(struct gpio_aggregator *aggr)
>  err_unregister_pdev:
>         platform_device_unregister(pdev);
>  err_remove_lookup_table:
> -       kfree(aggr->lookups->dev_id);
>         gpiod_remove_lookup_table(aggr->lookups);
> +       kfree(aggr->lookups->dev_id);
>  err_remove_swnode:
>         fwnode_remove_software_node(swnode);
>  err_remove_lookups:

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that gpio_aggregator_deactivate() does use the correct ordering.
However, there is a second difference: gpio_aggregator_deactivate()
does not have the call to fwnode_remove_software_node().

I am not very familiar with swnodes. The kerneldoc for
platform_device_info says:

 * @swnode: a secondary software node to be attached to the device. The node
 *      will be automatically registered and its lifetime tied to the platform
 *      device if it is not registered yet.

So perhaps the call to platform_device_unregister() takes care of
that?  But then it should not be done again later, if we jumped to
err_unregister_pdev, and not to a later label?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

