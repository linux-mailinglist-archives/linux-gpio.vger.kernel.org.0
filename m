Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3AD3057D3
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313894AbhAZXIQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 18:08:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727378AbhAZFJZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 00:09:25 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC90C0613ED
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 21:08:20 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id gx1so1540672pjb.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 21:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=FU71qPbIJQVTuxT6YbCDyAvn+zOVqEswtHSNOm8FjI0=;
        b=Xhu/uOys82DIaKhKIWPIOFCE+R/lI/8W9VQ12UqkRsnR2WYYvyGb5vYTUwDmE39gg2
         oyuI/FBGErVKFGrytbnMunurR/1y4by7R3UaxrH/dWmhJAmMergoLtpg5amFowBZoDmI
         kAjKCrbP6BpuzCCgb8Vv+Ftu4AMzeF5k/VDiRqUBdvzHFRvkOMfTrqIyLnvuJO00+bax
         xCK8y/Pw1UwXXPG9FGbzS+13SlgWQKi2wIuPDB1mCJFBTd35J4foW9JD+yDHOSygLWHR
         cZmA8YwyGOIsoOvm6/JozQExERFKYmknox+Y2nkjsY1H9JaOajzEJKbMrD2Zn6BAQ5Rv
         9u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=FU71qPbIJQVTuxT6YbCDyAvn+zOVqEswtHSNOm8FjI0=;
        b=BCWxafvTtTgyY0ws7QIAzAkeYJdWJu7VP3uUMiEQhxg2pGzyALb2s1Kr3fj9Bg4TH8
         IxrnSqUqNoSEKEYbm1lY6oViY37ySrZJgf16R23Jka63Ki+erp6fib3Smy905WR+K+pw
         xVDIEr4WXQ5N4eiVmEgD8jmJEbHpslLw3bbS84J+tip8x5//oddmpOMtMA63OOoTFhZn
         vK8FqBXg4WiJFqdYS2K815vQPVIa3RC5hpVyb9xNWFwQOwOBGHzEtlnQ064zyvToPHDA
         DgRZunOOHCCue9E3x9ZnbB/LzPrR5ikfhxzcw4sQENn2JmFqExuEnYAVSWohJBNjad3q
         dXxg==
X-Gm-Message-State: AOAM530pP8r8g6K1DfcgSbezqbIBiP7ZcK6fVKYX5n73RGTSfUe+WUYE
        RrZzX5VYyLhB0MvYn4vaUVtYzFLyYQpqIw==
X-Google-Smtp-Source: ABdhPJyfHrpS93QjLT54XIVTxubgwCp8usm7xe/w0kMToYGrbPz6QqD6EeIEfcusqUuEtd2A4GZnZA==
X-Received: by 2002:a17:902:523:b029:dc:1aa4:28e7 with SMTP id 32-20020a1709020523b02900dc1aa428e7mr4379086plf.4.1611637700060;
        Mon, 25 Jan 2021 21:08:20 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:dd5e:ff29:33fe:cad2])
        by smtp.gmail.com with ESMTPSA id fv19sm933893pjb.20.2021.01.25.21.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 21:08:19 -0800 (PST)
Date:   Mon, 25 Jan 2021 21:08:17 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: pinctl.rst instead of pinctrl.rst?
Message-ID: <20210126050817.GA187797@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I was having trouble finding the pinctrl rst documentation until I
realized it is named pinctl with no 'r':

Documentation/driver-api/pinctl.rst

Is there a reason for this?

Is it worth me submitting a patch to rename and change tree-wide
references?

Thanks,
Drew
