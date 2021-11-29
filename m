Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36D14613DC
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Nov 2021 12:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238907AbhK2Lc5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Nov 2021 06:32:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbhK2La4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Nov 2021 06:30:56 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7293DC08EA7F
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 02:42:28 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id n85so16392534pfd.10
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 02:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k8UDcnwClRE45MxKp2tdPz2z9R6vL5btsGZ1KG/povQ=;
        b=ATJs3XxrNuqaaVtv5eI2lF7EZ2hX63ievBHhQaHlz5nG8UC0K2UbkfVoyo3XA5unAD
         PS0yfYZqVwBTnN4VVdl5gyjGQDNpVg8jgLwJ2mIGCRcvnxKG0crlzZAZ58M1CIaIk3/c
         MbUb4fPMLG/gvipkDNK9hXk/QjsoLTS9mapL3gZoC+pOlwxT4GWfAigSxst35UuW15cJ
         iQ+ATw6wh10fUhilAfMe24iM/Q5Vif6WA+XR+Lt3CMQr4QvKLgKUdzbuI6dUUXABYUIP
         tsUPkfvEG01bjzf8VS82pSreiOxbG1g6fgxlVK4CzAtDHcuxfkzTWTmeR1BD2MnwKIAS
         X1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k8UDcnwClRE45MxKp2tdPz2z9R6vL5btsGZ1KG/povQ=;
        b=8BJQjxAIHBJlgoYADnM2juEt6blTMVdU6j7zNWOIuMH5vVUPxJbDGADG4+DCkIIk2L
         DbpLAjh2yAzWVL64Ux7iQzUGuC6ijQe4GogN3QMrLE6xBZ9jOaFOnYZsm+m5hQ1i+VpW
         fdBVsgnj0vHKsw1/XK/+YSx1yt8UOM+LlLWISv4n2HD0SCCcAXgQlJcXqeYr5BnLKZ/j
         0yJMG0kk/GvI6gXPGWeoRLIB6qz6HGH44dv/PwTu4rqlvHXtu/I2QV/HW0qdT/NMTvxt
         PG39WXMmzwnWvbVcxZE2CPz2i1Sf9J5Eh9gAx0zWKzRCY1nZ2wUp47a/KaD5mYm/ipDG
         G0fA==
X-Gm-Message-State: AOAM532BnqMJYYZ5upbzIFKC1UYIuxV8yUv6O1NiZr/D/SL+hLSY0WMP
        iz+tsWR3yCvCOKledgB/hQigRw==
X-Google-Smtp-Source: ABdhPJwLOJrrbk6b5RIH3qZA4vDNT4iio7VvHaSP76kLYES+G4eXF3cHOptsh0dg/sUJovkO3tAQ7Q==
X-Received: by 2002:a05:6a00:986:b0:4a2:c1fa:8899 with SMTP id u6-20020a056a00098600b004a2c1fa8899mr38248889pfg.61.1638182547990;
        Mon, 29 Nov 2021 02:42:27 -0800 (PST)
Received: from localhost ([122.171.9.64])
        by smtp.gmail.com with ESMTPSA id h5sm13068582pfi.46.2021.11.29.02.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 02:42:27 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: [PATCH 0/2] libgpiod: Add Rust bindings
Date:   Mon, 29 Nov 2021 16:12:21 +0530
Message-Id: <cover.1638182138.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

This patch adds rust bindings for libgpiod v2.0, this is already partially
tested with the virtio rust backend I am developing, which uses these to talk to
the host kernel.

This is based of the next/post-libgpiod-2.0 branch.

I haven't added any mock test for this as of now and I am not sure how exactly
am I required to add them. I did see what you mentioned in your patchset about
mock-test vs gpio-sim stuff. Rust also have its own test-framework and I am not
sure if that should be used instead or something else.

Since I am posting this publicly for the first time, it is still named as V1. I
have not made significant changes to the code since last time, but just divided
the same into multiple files.

--
Viresh

Viresh Kumar (2):
  libgpiod: Generate rust FFI bindings
  libgpiod: Add rust wrappers

 .gitignore                          |   6 +
 bindings/rust/Cargo.toml            |  14 +
 bindings/rust/build.rs              |  60 ++++
 bindings/rust/src/bindings.rs       |  16 ++
 bindings/rust/src/chip.rs           | 197 +++++++++++++
 bindings/rust/src/edge_event.rs     |  78 +++++
 bindings/rust/src/event_buffer.rs   |  59 ++++
 bindings/rust/src/info_event.rs     |  70 +++++
 bindings/rust/src/lib.rs            | 268 +++++++++++++++++
 bindings/rust/src/line_config.rs    | 431 ++++++++++++++++++++++++++++
 bindings/rust/src/line_info.rs      | 186 ++++++++++++
 bindings/rust/src/line_request.rs   | 218 ++++++++++++++
 bindings/rust/src/request_config.rs | 118 ++++++++
 bindings/rust/wrapper.h             |   2 +
 14 files changed, 1723 insertions(+)
 create mode 100644 bindings/rust/Cargo.toml
 create mode 100644 bindings/rust/build.rs
 create mode 100644 bindings/rust/src/bindings.rs
 create mode 100644 bindings/rust/src/chip.rs
 create mode 100644 bindings/rust/src/edge_event.rs
 create mode 100644 bindings/rust/src/event_buffer.rs
 create mode 100644 bindings/rust/src/info_event.rs
 create mode 100644 bindings/rust/src/lib.rs
 create mode 100644 bindings/rust/src/line_config.rs
 create mode 100644 bindings/rust/src/line_info.rs
 create mode 100644 bindings/rust/src/line_request.rs
 create mode 100644 bindings/rust/src/request_config.rs
 create mode 100644 bindings/rust/wrapper.h

-- 
2.31.1.272.g89b43f80a514

