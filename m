Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 677FF131C4B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 00:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgAFX1Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 18:27:24 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:39742 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgAFX1Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 18:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1578353241; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=hm9iPs1F74ZQ5Kvwq86O7Y8wfg6BjQF4bC4mxGPIDDc=;
        b=YAQqV2fO54vLyla2S7iJ6OPOah9rHhl3pfVh92pWXiJj96uRuy5b/r9kYpkGLfk5C7kzDd
        +7VoOI2Rm4f+ZRmKytgOw+gXFwSTxVaEdvAKeuBrpe6e6s2OfnQWhqXnXDKJbVnqwAI6v+
        7RuxqNAynrJIG6IToCR45hh7I3g8jtI=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] pinctrl: ingenic: cleanups
Date:   Tue,  7 Jan 2020 00:27:06 +0100
Message-Id: <20200106232711.559727-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

I saw you merged Zhou's patchset, here are some cleanup patches for
pinctrl-ingenic that should be applied on top of his commits.

Cheers,
-Paul


