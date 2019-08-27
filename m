Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBE339E6E5
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 13:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726972AbfH0LhE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 07:37:04 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46752 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfH0LhE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Aug 2019 07:37:04 -0400
Received: by mail-oi1-f193.google.com with SMTP id t24so14619914oij.13;
        Tue, 27 Aug 2019 04:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ve3KoreqHyIFhgPpO/maecjJwdpD6AOQYGYNWVJFvNI=;
        b=MvFgxQgE64SzoHTIS33X4w1T65dFAco/IF2kQtreLLDmunBJVRvyUSE3Svjr3+Q2OY
         ktJ7wv0jTZW/hUWqGHzZYoQn2ToeE6JrGtMAtVgY3vSzHXw1ywnA8WHAHJpKd0biZTaD
         gaafrQTU+jfFw25ZfNNRKAVrRrSAsuJJwDxb00z64BAgNGcs2X4VMCBIC0v2Y04SVQd4
         9jf953eBeu5HqBVR6qAzotiOMiQpUGYFyd7R5k3gM9RYvw8cIMg3HANPSNh746D10Myy
         f0VtlLTFLkWt8IvjCV87PRKbLPeobutOzIa00AKRHi5T9rJOS2nEgC9zLuZIhWyN7hpj
         eRVg==
X-Gm-Message-State: APjAAAWZbQAn23LlNYfOXnBR+1v86oheAyAnDfXIlNHwb59ayOwa73KI
        TjFISQem5D/zx7J3c4/NtJQP//oEEp1MTCNZKRg=
X-Google-Smtp-Source: APXvYqxQsjIWXGY79HjcrhPPZ1+TAFdwFWYz+QnSRaD8HlD35xql501usH13b51lFYYHjes4m1fIzOreotml9zoYlWU=
X-Received: by 2002:a54:478d:: with SMTP id o13mr15848747oic.54.1566905823555;
 Tue, 27 Aug 2019 04:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190827113527.99831-1-weiyongjun1@huawei.com>
In-Reply-To: <20190827113527.99831-1-weiyongjun1@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Aug 2019 13:36:52 +0200
Message-ID: <CAMuHMdUobaBZOZjVY7=rvJq=NCqsX6aQwbT9f81HM45wbTjNaA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: sh-pfc: Fix missing unlock on error in sh_pfc_func_set_mux()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 27, 2019 at 1:32 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> Add the missing unlock before return from function sh_pfc_func_set_mux()
> in the error handling case.
>
> Fixes: 8a0cc47ccc7c ("pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks, but this is a duplicate of
https://lore.kernel.org/linux-gpio/20190827093927.GB8443@mwanda/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
