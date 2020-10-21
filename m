Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8FF294A2F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 11:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389048AbgJUJJp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 05:09:45 -0400
Received: from mail.intenta.de ([178.249.25.132]:25710 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388054AbgJUJJp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 05:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=Content-Type:MIME-Version:Message-ID:Subject:CC:To:From:Date; bh=4+JLmSdoZl18TAJEqStnByuocthWGAI7dD34rmmWrqQ=;
        b=jb4+W+bmAFq2J0HQa5uq/pFOS8gfx6b3xbpwc1timxzXQvl4MSxP80xh91e50wlPV59hYSETkD3VLMUaMrjthn+Khe7yQ6hPaCb15+SElupBU54Gv9gFPXO1BWYyae5TbSEAHqRN8Aem2XDeADdQmCxFbW/lXOaV6T+7yUW2toOGj5OpNNrbgpu9rpO5Qwg/rvXNYItivIbZFDOFS5AIylU4q3eiZsl5+j0TvlmQNgeufw05oCzmbYibwFam4gt1e88z4CrPLgEf6wEo/1khx83I2TuQjwlKwXdR0Sm8W8CVRjLwF+E0bEc8eGXkSpmjUV2dLOXmIW6VAbcU2L7Gbw==;
Date:   Wed, 21 Oct 2020 11:09:40 +0200
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>
Subject: Why is the /dev/gpiochip line event kfifo so small?
Message-ID: <20201021090938.GA13202@laureti-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I was looking into using the /dev/gpiochip API to detect pulses. In my
application, the crucial bit is to precisely identify the start time of
the pule and the API mostly helps doing that by providing high precision
kernel timestamps. However, it stuffs them into a kfifo with 16 entries.
When your hardware is not properly debounced (which it always should,
but often isn't), that space can fill quickly. Is there a reason to
limit the API to such a small number of events?

A single event is 16 bytes. So for every line, we incur 256 bytes of
kfifo space. This space is only incurred for lines that are actually
being watched. It seems to me that bumping up this size would not hurt
badly. Non-realtime applications could then read events after-the-fact
with a smaller risk of missing ones. I've encountered a full kfifo a
number of times now.

Helmut
