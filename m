Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6C7571368
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 09:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbiGLHtK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 03:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbiGLHtF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 03:49:05 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D6B27B0D
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 00:49:04 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 867693F1BC
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 07:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1657612137;
        bh=vNBZvuUXiXCxiG8WzoPq174R/6y/8FtvVvGT3U1v9yQ=;
        h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
        b=LYa2uYYPfjNZcA20V2e6jQKf32d17Z3rPAYt9iA7tQWCNl0Q8K9rNS5VmhyT4turk
         e5gPmbx2FzVWQdy4BozlVoAUl65SkZ44JnA9UG8Lih2vQSt6TB2OSBXDz0edXbgzpQ
         aRLWdqF12cTTIjaRKFf5tqd4mvjvoT/3nbpBkd8HPVlA+QgQrtpIShIXMr5TfUTRtt
         4laI84WQ5HCENJ6ZIs/AufQ0imh0N9GcDXbzkXh9UBzSPPpBiaAE2/RWrckSob4qI4
         SuM/qmJeAw64M+jOy5NAgALp4HDBOS1mI/XTAh9fvKLskk3niSFk4GIe77du6M7XBs
         qtQdEPf6YhfQg==
Received: by mail-ej1-f69.google.com with SMTP id ga9-20020a1709070c0900b0072b4d787f5dso1705166ejc.21
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 00:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vNBZvuUXiXCxiG8WzoPq174R/6y/8FtvVvGT3U1v9yQ=;
        b=IRK2kDt5qGas5fJxHOv/kO22zEbRhUwEfdng6alyUjbsJ1gOXOlyDqSssYG+LjtD49
         UErOTeyFTwkBiG1CuPfZ1hs1cPTIIPw3tI9VhRGdiBPwwZQudpkR2Xq6G6gYj6564df9
         +IVEV3ifHv5pVrzISzNmsy1YvTKf/7DuW8gah/ZXxaIVmOxDtNu5rlp6y72JeYsyoYJs
         scZqv8fjFVHXtaYuxY20AKAPXujzBGy9Wckw5c0k3yxqMD5FoUE1ScDtGgruYJff79Jv
         PNoN9V/q1S3ByvF3TK5XCww/RO37AK7DLC+VDCzqS9pyULkVZEvob8uCrweSyWE3liN8
         TBUQ==
X-Gm-Message-State: AJIora/Tfg3YHUjXy1/SXRZmkPT3eYdN5Epaq/URBhowKdUC/9aQjyZo
        UKwBdVjdreqhpNP5XphQYW6TsQCKuJI+CKCi1ufx9IlBgt4lkZJ3rB3OSJuiJSRqH57A/1iDVqT
        a5GAhl5iXmkJrsQ6kKnKUCYfIzIFbeycsPjt2UXkXp0TwB5wlzwb4Rzg=
X-Received: by 2002:a17:907:7745:b0:6f3:674a:339 with SMTP id kx5-20020a170907774500b006f3674a0339mr23171708ejc.207.1657612135915;
        Tue, 12 Jul 2022 00:48:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sKYiyaVXyjLX2K8AMBJ+btE5lXskW7S/DIpnNUwqaIqJ5PAG/WMZxBrdtZXYX9M2gauyjRuECXBD+kUypXypM=
X-Received: by 2002:a17:907:7745:b0:6f3:674a:339 with SMTP id
 kx5-20020a170907774500b006f3674a0339mr23171698ejc.207.1657612135771; Tue, 12
 Jul 2022 00:48:55 -0700 (PDT)
MIME-Version: 1.0
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date:   Tue, 12 Jul 2022 09:48:45 +0200
Message-ID: <CA+zEjCsqpAffGqJPJrsLJLeyrJJDch_-Qctb1Zxi+j5JU9Wg9A@mail.gmail.com>
Subject: libgpiod API v2 release
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Ubuntu kernels do not enable GPIO_CDEV_V1 as it is deprecated, but the
libgpiod package that we ship is still based on the latest version
1.6.3 which does not implement the API v2. So I'd like to update
libgpiod, do you have any recommendations about what branch/sha1 I
should use? Do you plan to make a release that implements the API v2?

Thanks,

Alex
