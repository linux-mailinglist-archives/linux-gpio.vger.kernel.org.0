Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7552D1EFF64
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 19:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgFERuo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 13:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgFERun (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2020 13:50:43 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5347C08C5C2
        for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2020 10:50:43 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id ga6so2980501pjb.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jun 2020 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=+Tsx+LXvxUj4PwW1GQ76UVMNYHyIY/3fzSajkL3XCfg=;
        b=DlopmtE9K6UmbpFHasMEZ+K7/0GDkXJpm07QDMukTkmTCNaPMbGXnx/dpfsbHqQu3x
         O8SoC+jyN/6iYXeaItq40GADOLgEY1zmIowbMnejq4R2YzCr5E1mKsFaoYsTLCXqEXKU
         MCRIIonw1nWmm1zWVDYE8KnRgvJTz/M0yMqqD+tiwsrd0+63Vw71cX1Zaft0IbVh5iGg
         3d8YII/MjyFZBpnPTB8na9pY8IdxfeXx8apKlm3MxEtT3GszW+0Iob1mq4IDQIo79HCe
         RCmq19e/ICtDgnJ++o4Z4/63fS6ir5q1Hxpj0hXTJ06xEEdV8Z3ttxxX8ZjFK4aEOl15
         Alhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=+Tsx+LXvxUj4PwW1GQ76UVMNYHyIY/3fzSajkL3XCfg=;
        b=c24uwhnNH1Wmfdv6pM7IJtix/RUVKAoHa5Ft+YftcRjnpSguNK0BbcARDiHesZD2tF
         0IWlveVBdd8GwAQOjkSrrjBwFUvGk5EnIX9fbdsZZ5tmAk9YmzUKoR4meFbCfSC8OGTl
         aLib44sT764YLqdYB0p0CUEkKFXy6Nk80VgOxDnxGr0NCL2AYU1DAW5KagEmOqUPZObo
         XoGDEWmWwqsao85DN27426m6PQzkdO+WmeR+/D8n2VR37f/yojQ43aJihfsNoapm/kon
         UgVi13/Q/yzdIuA4qCctxLqul89tIqcPJ9Z1rYNCVuE+DnUz9GhrJ6Oqh1m9blvU735c
         6pUQ==
X-Gm-Message-State: AOAM533TR31LvlRVIH8Ez0sIV3fcEusSF2BOJ6aJOC8hBUj0z07ecXjD
        iJT1Yv8Nsx1LctBCruEJcUm9cplF
X-Google-Smtp-Source: ABdhPJxtzJmUbAU8b7+hfQaJ4e0wXamCT96hTMSkk+8whluRWQaNIKJ+vYiMzSaOllRT+Kk2xrdUpw==
X-Received: by 2002:a17:902:7d85:: with SMTP id a5mr11151960plm.106.1591379443029;
        Fri, 05 Jun 2020 10:50:43 -0700 (PDT)
Received: from [192.168.1.110] (c-69-254-151-52.hsd1.nm.comcast.net. [69.254.151.52])
        by smtp.gmail.com with ESMTPSA id 10sm238595pfn.6.2020.06.05.10.50.42
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2020 10:50:42 -0700 (PDT)
To:     linux-gpio@vger.kernel.org
From:   R C <cjvijf@gmail.com>
Subject: [libgpiod] general libgpiod inquiry
Message-ID: <1411c83c-a247-b1ed-ef57-983104630d2d@gmail.com>
Date:   Fri, 5 Jun 2020 11:50:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I don't know if this is the right spot, but I didn't really see any 
'community' with the libgpiod topic as an interest

I was wondering if there is a mailing list specifically on "libgpiod", 
like on other topics, with a users / dev list etc?


thanks,


Ron

