Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D43F79E415
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 11:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239380AbjIMJqr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 05:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjIMJqq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 05:46:46 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67367199E
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 02:46:42 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a21b6d105cso842131466b.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 02:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694598401; x=1695203201; darn=vger.kernel.org;
        h=message-id:from:to:cc:subject:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ioL+ngYgF6+Jep7NJ/REAwAea9/5PWSnpAtWqJWKAMc=;
        b=B+P7l9neDxAZ1Bp5FF+ivVb7xaMuO5k8p6aLvVb/u1OkDZF1QQ3KLYG4ISfU3b+wB+
         Vzr7x+KQpnCF0L6Il11TM05cix5qrkZP6JyK6LTQTIJNrTgPxeD9TMrc12rS/PRfyeuG
         lWKSe3nlR2CumLTfGRAn24TF19IVqBnmQtsk1toB2tTtqmemotr2ErUHsnwdwhEFLKIA
         9fYq9P4z4SwuuWQhzh6a7j/twvor64LfJCzKb9o3h5fuOlxc6OlazQxqb2au/5ie1sJz
         szhJyD+XYVDMEbbGf2FapRoIso+9TZJNxKMIvE7XEbT94EHfht0zFbSRC+ipRVjSxiZ3
         FlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694598401; x=1695203201;
        h=message-id:from:to:cc:subject:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioL+ngYgF6+Jep7NJ/REAwAea9/5PWSnpAtWqJWKAMc=;
        b=eP15bHvWRVFmbu4806j4krqc31lNgDjjWRd1Mr64W3m06D6ZsUJ7QbepDuVmno48ks
         1DAcQqbZ25zSNKC28UBoZks+F0eWj0SOZFQ3gyBo8X0pnJ0wN1AoQxrZ429yZbULISin
         wWeCigvMhFaqUl/eSYBo+rWEfdEGoRy3iLWnMPuPDVP00gG45neGBHlNYduCCoFEETI+
         waXR2LMLn8K5H7wPnqRgnJ39TrdcJafbuoVpdwXm+E2QpVRo49faXPmeJX0RpXtaK+E2
         z1IgXkKX/UMSc0Iut2MLbzYH3yksaaBYnfOW18ko7H7ODemRLdg6x10UgDhft3YUX0TG
         y1Zw==
X-Gm-Message-State: AOJu0YxeANm90V9Jxuo2EaKWprI3R3e61gHRVSzw1GraSp2CKXbYhcPY
        OUxa+y5ke2MioPD/DreL8Ew084COAJjFiF2MKx8=
X-Google-Smtp-Source: AGHT+IGMkDf5Xf5y9mrnF8YEXKb9pSnmPcrFqeBufmH9Su9YmucPBy8aCiqtmHSVlVGqUDlQbGh6PQ==
X-Received: by 2002:a17:907:a056:b0:9a5:ca42:f3a9 with SMTP id gz22-20020a170907a05600b009a5ca42f3a9mr1197178ejc.2.1694598400824;
        Wed, 13 Sep 2023 02:46:40 -0700 (PDT)
Received: from localhost (i5C74380B.versanet.de. [92.116.56.11])
        by smtp.gmail.com with ESMTPSA id sa30-20020a1709076d1e00b009ad75d318ffsm3066566ejc.17.2023.09.13.02.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 02:46:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 13 Sep 2023 11:46:39 +0200
Subject: [libgpiod] Thread safety API contract
Cc:     "Viresh Kumar" <viresh.kumar@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To:     <linux-gpio@vger.kernel.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Message-Id: <CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work>
X-Mailer: aerc 0.15.2
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all!

Currently it looks like libgpiod does not document any kind of thread
safety gurantee. However, the Python bindings tests
(test_request_reconfigure_release_events) are using sequences like this:

Thread 1 creates chip + some watches
Thread 1 creates Thread 2
Thread 2 issues a request_lines on the chip
Thread 2 reconfigures the line direction
Thread 1 joins Thread 2
Thread 1 closes the chip

Implicitly this depends on a couple guarantees:
1. Calling chip-related functions does not require synchronisation
   primitives (other than keeping the chip open).
   -> wait_info_event, read_info_event and request_lines are called
      concurrently
2. Requests may be modified by other threads
   -> at least reconfiguring the direction is done

Looking at the C implementations, it indeed looks? like this is a safe
thing to do - with the current implementation.

My question is: Is this an intentional gurantee that will be guranteed
in future releases? I am trying to figure out whether the current
contract exposed by the Rust bindings is correct and/or may need to
be extended. So which guarantees are provided by the current and future
C lib?

Currently, the Rust bindings are advertising that the chip may be `Send`
to other threads. This means one thread may forget about it and another
thread receives it. In contrast, a request for a line is currently not
allowed to be transferred to other threads (it is missing the `Send`
marker).

While in C and C++ thread-safety is typically not enforced by the
compiler, Rust has mechanisms to do this. But I would like to document
the C lib's situation before inventing rules for the Rust bindings :).

Trigger of my question was that we glossed over these details in
vhost-device-gpio:

https://github.com/rust-vmm/vhost-device/pull/435#issuecomment-1717205620

- Erik
