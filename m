Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E58EB4E2B13
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Mar 2022 15:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236605AbiCUOo3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Mar 2022 10:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349528AbiCUOo2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 10:44:28 -0400
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 62B9825E0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 07:43:02 -0700 (PDT)
Date:   Mon, 21 Mar 2022 15:42:56 +0100
From:   Alexander Dahl <ada@thorsis.com>
To:     Hans Kurscheidt <lve0200@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: gpiod: Set pullup for Input Line
Message-ID: <YjiO8CScFFVjiy1/@ada.ifak-system.com>
Mail-Followup-To: Hans Kurscheidt <lve0200@gmail.com>,
        linux-gpio@vger.kernel.org
References: <Yjh+1DbmLoKGtIE8@ada.ifak-system.com>
 <33b30df9-3763-7ced-88f9-3b6e32ae236b@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33b30df9-3763-7ced-88f9-3b6e32ae236b@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hei hei,

Am Mon, Mar 21, 2022 at 02:48:02PM +0100 schrieb Hans Kurscheidt:
> sure, device trees are eventually overwritten w/ new kernels or "as is" on a
> new device. 

You would need a board specific dts or dt overlay anyways.  Just compile
that again with you new kernel.  For a new board, you need to make a
new dts anyways, I don't see the problem here.

> Hence my application won't work on a new installation/board,
> because it needs certain GPIO input pins w/pull ups. 

Well, and those pullups need to be in SoC, and can not be external?

> DTBs need to be
> disassembled and re-compiled, which is not for the average user to install &
> run an application!

Why disassemble dtb, just go with the dts and compile that.

For easier handling in your application and across different boards,
you might want to checkout gpio line names.  We successfully used that
to let the same application work with different boards (even with
SoCs of different vendors), without the need to modify the app at all
if the hardware changes.  That is much more convenient than putting
pin numbers and knowledge about each and every possible board into the
application.

HTH & Greets
Alex

