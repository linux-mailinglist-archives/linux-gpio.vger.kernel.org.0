Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857722D15B7
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 17:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgLGQMV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 11:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgLGQMV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 11:12:21 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6274FC061749;
        Mon,  7 Dec 2020 08:11:35 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id m9so9288385pgb.4;
        Mon, 07 Dec 2020 08:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=AIJ8KR0Iszkjo0JlYPCuo37Z69/3yfafvl4dM49hZeQ=;
        b=XyMwVXoOQPvKvauEZ69k01nmRFz6rIHnRGZwt9PtyQZxCb9glejziuR8WKFSqosb0B
         jcffxAh607wPKhQxYnQTE9NlSAuTUxpamkeMV4GVZ1D9fMBuwUr3kecqvePAMxbw6J6Z
         YQm1BYeVe45yZ87SF5FCsc1O/PYrShJrJYM6VsmrxDetjra5Hf9kc6JyD4OecxLjnBZu
         +ZQGetsH1JrBmQXvI4a0A+wmJEZtA03d34cZ87yfbgLxSOEC8bD0aaHX4traeUMGIwdl
         d31i8JE9auh8B5QC6cUP9SB0IyqmZ5uDthYuDVXkvUE5LP1T56xMjIsWLAeX7uz8XA5/
         8jSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=AIJ8KR0Iszkjo0JlYPCuo37Z69/3yfafvl4dM49hZeQ=;
        b=ghSjT9qgYXg+bbNOD1v7t0g4MTqb3MXrwH5QBV4DUIXIMjqMLET2AGK82as0Um/Oh8
         eIP2oWk7L+CRg7ujzRbLMNcrb3GDDz/Trtv0Gut5A/F+teynKaRF4KaCMinUSBHW423D
         M0R/XasQh5MNDqgaSBrqvW+VU9WUaY2wj8oEElCabuzoXbJhg1ucvjdmH+VefQNNA/YF
         3Q+lZLmmdhQFelHboWS5StLLWM5RlUAVERXradsnPGtbk4zd8llngUJsB1MFGJP66/+H
         jx7vuGhmN0spcwHs5vAXQ9sw66d274pwvsd6NOIq5HsfjvNvXI1zOhvwMqa7gUe3IsDj
         Pdiw==
X-Gm-Message-State: AOAM532OMxnMuxfDFG2hXiFWXV7a1iHG1nzCbemU5R+JHQbttM1RS6I8
        GNSePtWVdnhAuWgQwrFPyafbXIB5XldonQ==
X-Google-Smtp-Source: ABdhPJxR38UiFzYHVLNBu8cku5j5cECpPkcOutZUwXxReWXMby7IfXJSqwzvgs6JP461v6+ymgm+mQ==
X-Received: by 2002:a63:5322:: with SMTP id h34mr19280651pgb.95.1607357494945;
        Mon, 07 Dec 2020 08:11:34 -0800 (PST)
Received: from manjaro (ik1-419-41911.vs.sakura.ne.jp. [153.127.43.165])
        by smtp.gmail.com with ESMTPSA id j19sm14505362pff.74.2020.12.07.08.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 08:11:34 -0800 (PST)
Date:   Tue, 8 Dec 2020 00:11:22 +0800
From:   Zhaoyu Liu <zackary.liu.pro@gmail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: remove the blank line in pinctrl_register()
Message-ID: <X85UKveYKc3xLPVk@manjaro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove the blank line in pinctrl_register() to keep the code neat.

Signed-off-by: Zhaoyu Liu <zackary.liu.pro@gmail.com>
---
 drivers/pinctrl/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3663d87f51a0..1f944685047b 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2115,7 +2115,6 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 		return ERR_PTR(error);
 
 	return pctldev;
-
 }
 EXPORT_SYMBOL_GPL(pinctrl_register);
 
-- 
2.29.2

