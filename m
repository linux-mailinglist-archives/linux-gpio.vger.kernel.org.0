Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2A712497A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 15:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfLROZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 09:25:07 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55132 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbfLROZH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 09:25:07 -0500
Received: by mail-wm1-f67.google.com with SMTP id b19so2032938wmj.4
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2019 06:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q2DVIrNTv8BA7rmva9eEQw5DGQ7v3GkynSqeHhcguXc=;
        b=z1/iHG6VWBnZsYLutsMpAyFpeZeQwnjsh1xjboFmcyxyt0HV1AL6SQJsWgHQ10AjCe
         kon3GSfvvvdk806jrpT+W4x7ji1hX4wUYIjVVX1S7nAwvovFeDgs3F9KSO6HLNIVBalf
         X5tCjYv0mNtkOMFF2AcTOAez53E3j7WJoHNRewJdKID+F8zsvD+2d6qzh26SqoqFQa54
         zJCKtHX0UAN4aRVegiPOldUl73b/CI9mdEe8MoJUqCCaNoS9I07FNjijqr/sZy0rc566
         2fOL6KEzKQoYdwMm8AFEPR0mzE3cP9CQZEC+VqBAg0WYCrSgHdVMAKRMUXwLxvIQGBht
         +Q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q2DVIrNTv8BA7rmva9eEQw5DGQ7v3GkynSqeHhcguXc=;
        b=J7Oqo48Od9LaZDkZcW5QJDjlk3wJLiu9gV/P7JDvIwVBpMQD6xEWfhH7jiHTGPKxcO
         EZwm7mttesRyaUAM1fqTFrZASFsjfURofe4k0n4Ra8ZRIV4AMMR2FYyWON/sxgJTPxe7
         Jd3CrqG5Xjmt3UIoV44wYfe/vR8DjmtHFx8cOtew+GqGv8ZKLKwl6ut5sdEIDi64RCee
         Sw8GwRnvLHz54tNAyeM7H6sQmj6NxrrzTrhPSeov+xfSBbexamyODSviUgHbLvjKhVJO
         fwTUgVygIStsH/XStPDP0YQNpx+sLbIEsQsEZ0t2NXZJYDYJIPt8ICrTkPJQEt4ZVCyE
         nFWw==
X-Gm-Message-State: APjAAAULxkrFkc4L0qSdhu73rcjEPvQH/7UkCDxvVppvBuRGHwCjO57O
        lQrLn8ou74La/YZsO8pC6GTjCg==
X-Google-Smtp-Source: APXvYqwW4moK5UDu4uQuM/1xa6Cqzzz/PCnDKVwtZYyXEKf9h7NPeW46JTa5hA04hX5QUhOn0snuYA==
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr3727569wme.125.1576679105396;
        Wed, 18 Dec 2019 06:25:05 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id x11sm2889981wre.68.2019.12.18.06.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:25:04 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 6/7] bindings: python: add a method for reading multiple line events
Date:   Wed, 18 Dec 2019 15:24:48 +0100
Message-Id: <20191218142449.10957-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218142449.10957-1-brgl@bgdev.pl>
References: <20191218142449.10957-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a new method to the Line class allowing to read up to 16 line
events at once.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/python/gpiodmodule.c | 57 +++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 27a8118..b0b52ee 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -850,6 +850,57 @@ static gpiod_LineEventObject *gpiod_Line_event_read(gpiod_LineObject *self,
 	return ret;
 }
 
+PyDoc_STRVAR(gpiod_Line_event_read_multiple_doc,
+"event_read_multiple() -> list of gpiod.LineEvent object\n"
+"\n"
+"Read up to 16 line events from this GPIO line object.");
+
+static PyObject *gpiod_Line_event_read_multiple(gpiod_LineObject *self,
+						PyObject *Py_UNUSED(ignored))
+{
+	struct gpiod_line_event evbuf[16];
+	gpiod_LineEventObject *event;
+	int rv, num_events, i;
+	PyObject *events;
+
+	if (gpiod_ChipIsClosed(self->owner))
+		return NULL;
+
+	memset(evbuf, 0, sizeof(evbuf));
+	Py_BEGIN_ALLOW_THREADS;
+	num_events = gpiod_line_event_read_multiple(self->line, evbuf,
+					sizeof(evbuf) / sizeof(*evbuf));
+	Py_END_ALLOW_THREADS;
+	if (num_events < 0)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	events = PyList_New(num_events);
+	if (!events)
+		return NULL;
+
+	for (i = 0; i < num_events; i++) {
+		event = PyObject_New(gpiod_LineEventObject,
+				     &gpiod_LineEventType);
+		if (!event) {
+			Py_DECREF(events);
+			return NULL;
+		}
+
+		memcpy(&event->event, &evbuf[i], sizeof(event->event));
+		Py_INCREF(self);
+		event->source = self;
+
+		rv = PyList_SetItem(events, i, (PyObject *)event);
+		if (rv < 0) {
+			Py_DECREF(events);
+			Py_DECREF(event);
+			return NULL;
+		}
+	}
+
+	return events;
+}
+
 PyDoc_STRVAR(gpiod_Line_event_get_fd_doc,
 "event_get_fd() -> integer\n"
 "\n"
@@ -1026,6 +1077,12 @@ static PyMethodDef gpiod_Line_methods[] = {
 		.ml_flags = METH_NOARGS,
 		.ml_doc = gpiod_Line_event_read_doc,
 	},
+	{
+		.ml_name = "event_read_multiple",
+		.ml_meth = (PyCFunction)gpiod_Line_event_read_multiple,
+		.ml_flags = METH_NOARGS,
+		.ml_doc = gpiod_Line_event_read_multiple_doc,
+	},
 	{
 		.ml_name = "event_get_fd",
 		.ml_meth = (PyCFunction)gpiod_Line_event_get_fd,
-- 
2.23.0

