Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB9E325323
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2019 16:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfEUO7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 May 2019 10:59:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:59412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726900AbfEUO7a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 May 2019 10:59:30 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1EAE2173E;
        Tue, 21 May 2019 14:59:27 +0000 (UTC)
Date:   Tue, 21 May 2019 10:59:26 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     houweitao <houweitaoo@gmail.com>
Cc:     linus.walleij@linaro.org, yamada.masahiro@socionext.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        baohua@kernel.org, gregkh@linuxfoundation.org, jslaby@suse.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, davem@davemloft.net,
        mingo@redhat.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        sparclinux@vger.kernel.org, houweitao <houweitao@xiaomi.com>
Subject: Re: [PATCH] tracing: fix typos in code and comments
Message-ID: <20190521105926.5fa601da@gandalf.local.home>
In-Reply-To: <20190521144740.22490-1-houweitao@xiaomi.com>
References: <20190521144740.22490-1-houweitao@xiaomi.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 21 May 2019 22:47:40 +0800
houweitao <houweitaoo@gmail.com> wrote:

> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 2c92b3d9ea30..bfa5ab0663e7 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -8554,7 +8554,7 @@ init_tracer_tracefs(struct trace_array *tr, struct dentry *d_tracer)
>  	ftrace_init_tracefs(tr, d_tracer);
>  }
>  
> -static struct vfsmount *trace_automount(struct dentry *mntpt, void *ingore)
> +static struct vfsmount *trace_automount(struct dentry *mntpt, void *ignore)

"ingore we trust"

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

>  {
>  	struct vfsmount *mnt;
>  	struct file_system_type *type;
> -- 
