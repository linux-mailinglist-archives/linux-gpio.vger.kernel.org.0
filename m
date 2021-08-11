Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAA43E932B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 16:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhHKOAr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 10:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbhHKOAq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 10:00:46 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEAAC061765
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 07:00:23 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id t35so4667231oiw.9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 07:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=JLDqPnTrErzIDjJvOGkJ0wntx6Vkl3NlAuAHdNj6WXg=;
        b=K3hthmkAnDXwk/7jY/KWI0mnlFBodYmpu7Yz3sblQsSxsJfeGpI2vaF1m74UIYBvNE
         rZfpPjY7gS8FTIJ8nLX6XVVUVnjV5ESozsEC3QjrPrTkLWBV+adZtfIAPlj4IaMcpVOh
         rAO4Zd3P4WmZAv/Q6zFLzCGleuXRevWU+3T9jLSIYs8ats3cUNUggrtWc6FL1cNQYHjJ
         on2/MSRlwYfTts353knrEt/5fYXCxNfsHrNDCzS8YbKoJGYaffBPDlNaHu5H5Cf49JUy
         GdPiAM4HzqMNJzyWoruVxzADbWS7UDGcoa+t16MdESDTPnOPQYe/gICz9lSmNilpggFW
         cUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=JLDqPnTrErzIDjJvOGkJ0wntx6Vkl3NlAuAHdNj6WXg=;
        b=bviK4Dc9fgBdkAFhGzw0mx2pjeui+Co0JlrOMF274TFqtMbv4t7doaCSn3Ux2iVBs4
         2sBBO9fxRIpLDAkCoJgBa+f87RhjmMcFT4g3mVXylkf7RpjjzOKkwOG5eQWEgmIMsrac
         V2dqkLPvEJtq69ddqJRH9ij4MNhPrY8bSO768O3JsTTYAQ04xCnAtHF29VudgAnEC0rE
         ZARYbzBfNRi7Jj7RHFEIZTZ4BAxNVK97/eF1zhESa/E12FN0mUuMZgueZbJMgAstwzLI
         aZm4HOT+B93ekeVjl4j+xmKOy/ZVz4k/8Wbpselgm3dJ0ol5/wXCeUizLQ+5M5Cfk1AO
         roSQ==
X-Gm-Message-State: AOAM533Xl9DSu9py9rQkMoaK/MKC1+7v53BAwR/1lRe0wIox5iK/SFFU
        R8rP5BU4ogF53ciKMmmZCYOFwHty3gsuGO3kn+M=
X-Google-Smtp-Source: ABdhPJw9s++/wd+r/6TngXSlYP81x/L4dilpDDpkmMy0FFnQEip/wim+OTb9Tcc/0lIkyeSly4BZweHWp3iQ2nc13E8=
X-Received: by 2002:a05:6808:19a:: with SMTP id w26mr23774094oic.144.1628690422536;
 Wed, 11 Aug 2021 07:00:22 -0700 (PDT)
MIME-Version: 1.0
Sender: tadjokes@gmail.com
Received: by 2002:ac9:4998:0:0:0:0:0 with HTTP; Wed, 11 Aug 2021 07:00:22
 -0700 (PDT)
From:   kayla manthey <sgtkayla2001@gmail.com>
Date:   Wed, 11 Aug 2021 14:00:22 +0000
X-Google-Sender-Auth: w7ow68bGKq8qRivxYIOuNLwizo4
Message-ID: <CAHi6=KY1+yBvr8GKxUHN0QALvA2XHtvA52JyL26fS07HM_eBsg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello, Please,I would like to know if you received my previous message, thanks.
