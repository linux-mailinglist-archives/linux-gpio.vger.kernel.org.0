Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69A0613ACEB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 16:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgANPC6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 10:02:58 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55136 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728977AbgANPC6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 10:02:58 -0500
Received: by mail-wm1-f66.google.com with SMTP id b19so14143058wmj.4
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2020 07:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r9IO2t4EUB8vq/le/UQYX/kJysQD2wGi9iIq5cBrOC0=;
        b=PKw0i+zDZ9peTZ+YPK3rzVwcJw2YI19Fu5RkLsnSIGglohdAEmd2+q1mOlWc6xDcbD
         hrX5XYNHgw6POEEwue1wdI1Y+o5NkIRl5/C7huezZHsYdDqZGldsMYV3kph7jay+zr3i
         ZXVDysZeRx4rW5Mfch2YiM9ktc0WnjDPfhSSd5pYelYCg9k1xqteO86HTAfvaw5I+smv
         XvRIbCrwqZ9+75MlZloV4jLC8ZrxIo2+kpNKQdLH754C4TPyoxBOCPXN77iLTvCf/vUL
         1iWWsdduMu4X01Ty13Uqznesv3dYhDroxdbQWlv+/DcwBPCo+pMsi/7/k/9YleQ0Tx+N
         lAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r9IO2t4EUB8vq/le/UQYX/kJysQD2wGi9iIq5cBrOC0=;
        b=HFdTQ5kxCGb40EVkCxyrJtPxRD7usH9ssjO+sezv0aphRfDhOcOokUqpvg/2vpjP4Q
         zwd7eLqjdbyC/LYNJLePSeNnHCnD85XIxD9aLGIIxZ6Zk3f3nueqkGZV2DLu/1qiBHqP
         X1OKsYvVrgp3iaC1lAjn1PHhXtmGWJ+6qAjIisKlq8Rn4J3o76yBRDmw9tCfFjVZizCT
         gN3gkFdmmC/xzHOoEkPAYiXTFzjcjTeNZv9Yzo1jWy0eBCP/Uw5XzIRtytVLPdBDMutN
         Xjd/IbZUlB1aZeY/996U8MKFOSk3sy2YAzU5IKjS4hZ5+jefD2AWtmdVCJ3nAC6Nft7R
         Wo0A==
X-Gm-Message-State: APjAAAXOQVnPNHDcpqSrnF3dBAOEPczgqCDDSG0Yy9HaoIlHZKb3YErG
        wXfgnc1ZQvWkJUda5521+79rJQ==
X-Google-Smtp-Source: APXvYqwJFreF5WnZJIR7uF51w0nmbr6VtAN/xFBUNukeio9dENX6u6Q8TN4Yual8CujM+F3w6B5rlA==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr27444098wml.3.1579014176616;
        Tue, 14 Jan 2020 07:02:56 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id i10sm20311539wru.16.2020.01.14.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 07:02:55 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/2] gpio: mockup: minor maintenance
Date:   Tue, 14 Jan 2020 16:02:51 +0100
Message-Id: <20200114150253.28716-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Just two tweaks to the testing driver: update the license tag to conform
with the current SPDX list and sort the headers alphabetically for easier
maintenance.

Bartosz Golaszewski (2):
  gpio: mockup: update the license tag
  gpio: mockup: sort headers alphabetically

 drivers/gpio/gpio-mockup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.23.0

