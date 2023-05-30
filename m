Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA722715CFC
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 13:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbjE3LVi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 07:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbjE3LVh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 07:21:37 -0400
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1D21A7
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 04:21:22 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 194c7c4f-fedc-11ed-abf4-005056bdd08f;
        Tue, 30 May 2023 14:21:19 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Tue, 30 May 2023 14:21:18 +0300
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Gabriel Matni <gabriel.matni@exfo.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH] tools: gpiomon: add timeout option
Message-ID: <ZHXcLvUNvw75Z-3W@surfacebook>
References: <PH8PR11MB71425AE7A35F6E651A5B3425864A9@PH8PR11MB7142.namprd11.prod.outlook.com>
 <ZHXB83x85Qchv1XJ@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHXB83x85Qchv1XJ@sol>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tue, May 30, 2023 at 05:29:23PM +0800, Kent Gibson kirjoitti:
> On Mon, May 29, 2023 at 08:20:44PM +0000, Gabriel Matni wrote:
> > From: Gabriel Matni <gabriel.matni@exfo.com>

...

> My preferred solution is to run gpiomon as a coproc and have the
> controlling script perform the timeout. e.g.
> 
> #!/bin/env bash

Oh, this is too bad.

> coproc gpiomon "$@"
> while :
> do
>         read -t5 -u ${COPROC[0]} event || break
>         echo $event
> done
> kill $COPROC_PID

I'm wondering what coproc is and why it requires bash.

What I want to have and keep that working is that all our tools can be run in
Busybox environment (embedded application). That's why I'm against seeing bash
in any form of the tooling.

-- 
With Best Regards,
Andy Shevchenko


