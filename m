Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE059BE1C
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2019 16:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfHXOEf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Aug 2019 10:04:35 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35523 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbfHXOEf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Aug 2019 10:04:35 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1i1Web-00018u-Eq; Sat, 24 Aug 2019 16:04:29 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1i1WeY-0001MW-Dk; Sat, 24 Aug 2019 16:04:26 +0200
Date:   Sat, 24 Aug 2019 16:04:26 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Ingo Molnar <mingo@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Tal Shorer <tal.shorer@gmail.com>
Subject: Re: [PATCH 2/2] tracing: drop handling of NOTRACE symbol
Message-ID: <20190824140426.4kflanpydbafsmve@pengutronix.de>
References: <CACRpkdY62aXDOZm7cK4ND-RSnr9Ynz0DxS8-PHSF7i7diRG=WA@mail.gmail.com>
 <20190405194613.19578-1-u.kleine-koenig@pengutronix.de>
 <20190405194613.19578-2-u.kleine-koenig@pengutronix.de>
 <CACRpkda1xoUZGMCDWGSvA7MPxXC5qc3tp8UiZt+us19vppGpyw@mail.gmail.com>
 <20190408133506.xv3cwcqkqdobgz2r@pengutronix.de>
 <CACRpkdbYtsVLXC61jn_Gy_X33N4DBD9eumf3JNVCLemk0sGHzQ@mail.gmail.com>
 <20190408102744.66856bdb@gandalf.local.home>
 <CACRpkdax=n6hYfixSgsVaT2vPiZGdCC=tbQJrazzao946_M7yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdax=n6hYfixSgsVaT2vPiZGdCC=tbQJrazzao946_M7yA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus and Steven,

On Mon, Apr 08, 2019 at 04:29:15PM +0200, Linus Walleij wrote:
> On Mon, Apr 8, 2019 at 4:27 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Mon, 8 Apr 2019 15:42:55 +0200
> > Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > > > That's fine for me, but I'm a bit surprised you did that without an ack
> > > > from the tracing people?
> > >
> > > oOOPS no I guess I shouldn't, haha I just didn't
> > > look close enough, I thought for some reason it only
> > > applied in the GPIO subsystem. I'll back this out.
> >
> > No need to back it out.
> >
> > Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> 
> OK applied to the GPIO tree.

I just found this patch in one of my older topic branches and it still
applies to current Linus (Torvald)'s master.

Given that the only user is gone since 5.2-rc1 (commit
12f2639038ef420fe796171ffb810b30d1ac0619)

For reference, here comes it again, slightly adapted to reality. (Use
git am --scissors to apply.)

Best regards
Uwe

---->8----
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 5 Apr 2019 21:31:47 +0200
Subject: [PATCH] tracing: drop handling of NOTRACE symbol
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a header defined the NOTRACE cpp symbol creation of tracepoints was
skipped. Since this feature was introduced in 4.4-rc1 it was only ever
used by the gpio events and this was dropped in v5.2-rc1. So
remove this now unused knob, also to not encourage a new usage.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/linux/tracepoint.h | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 1fb11daa5c53..7d03805503bd 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -136,18 +136,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 #define TP_ARGS(args...)	args
 #define TP_CONDITION(args...)	args
 
-/*
- * Individual subsystem my have a separate configuration to
- * enable their tracepoints. By default, this file will create
- * the tracepoints if CONFIG_TRACEPOINT is defined. If a subsystem
- * wants to be able to disable its tracepoints from being created
- * it can define NOTRACE before including the tracepoint headers.
- */
-#if defined(CONFIG_TRACEPOINTS) && !defined(NOTRACE)
-#define TRACEPOINTS_ENABLED
-#endif
-
-#ifdef TRACEPOINTS_ENABLED
+#ifdef CONFIG_TRACEPOINTS
 
 /*
  * it_func[0] is never NULL because there is at least one element in the array
@@ -295,7 +284,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 #define EXPORT_TRACEPOINT_SYMBOL(name)					\
 	EXPORT_SYMBOL(__tracepoint_##name)
 
-#else /* !TRACEPOINTS_ENABLED */
+#else /* !CONFIG_TRACEPOINTS */
 #define __DECLARE_TRACE(name, proto, args, cond, data_proto, data_args) \
 	static inline void trace_##name(proto)				\
 	{ }								\
@@ -327,7 +316,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 #define EXPORT_TRACEPOINT_SYMBOL_GPL(name)
 #define EXPORT_TRACEPOINT_SYMBOL(name)
 
-#endif /* TRACEPOINTS_ENABLED */
+#endif /* CONFIG_TRACEPOINTS */
 
 #ifdef CONFIG_TRACING
 /**
-- 
2.20.1


-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
