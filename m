Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE2B3231A7
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 20:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbhBWTy5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 14:54:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbhBWTy5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2021 14:54:57 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA2FC061574
        for <linux-gpio@vger.kernel.org>; Tue, 23 Feb 2021 11:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=JkQL+E3lJfQjt5EDy61yDIEomfWT+mfZlgU67WweCJ0=; b=KftRF4wVYw7Pahi4StsN0Bz43x
        ERKAbbUxXExbVlYsjQ47mw2kePV2FGcS8MqnhZmPM4riwUOiFBqvWaxqcGaUD8XbciwbD3tsPP6JZ
        8qCcAyrunvf9YMSjP/wHgMe3rQhFELMGD1uwiDCAAYtcquBO6eynoGHQMr3BgjVlCPUjTKs0cy+ES
        +ulYQnv7tI7rUqJjGry3TZ4Ct8fyfuRvtPbCf9oTLxDZ4zf4ay6Pde4ufgUL3x9edrcnc8HRN3Ng0
        xOWZLYnHgR6m5mdvPMy9a9FX/YCxorSD7LcAIOrxUfsKels+guljWbbc1FsmmA4y2GkQPbSBwu8ml
        7ULYw8EQ==;
Received: from 194-168-191-90.dyn.estpak.ee ([90.191.168.194] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lEdl6-0005iD-9y
        for linux-gpio@vger.kernel.org; Tue, 23 Feb 2021 21:54:13 +0200
Received: by ubuntu (sSMTP sendmail emulation); Tue, 23 Feb 2021 21:54:00 +0200
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     linux-gpio@vger.kernel.org
Subject: [RFC] Driver for the NXP 74HC153 chip
Date:   Tue, 23 Feb 2021 21:53:25 +0200
Message-Id: <20210223195326.1355245-1-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.168.194
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Initiating a round of reviews for this GPIO expander if it could be
eventually merged in the kernel tree.

Basically I would like to hear how does it look and what is it missing.
Should something be added about device-tree binding, etc.

-- Mauri Sandberg


